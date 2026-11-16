import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Perfil.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static const String _dominio = 'udla.edu.co';

  CollectionReference<Map<String, dynamic>> get _usuarios =>
      _db.collection('Usuarios');
  CollectionReference<Map<String, dynamic>> get _nombres =>
      _db.collection('nombresUsuario');

  User? get usuarioActual => _auth.currentUser;
  Stream<User?> get estadoAuth => _auth.authStateChanges();

  // ───────────────────────── REGISTRO ─────────────────────────

  Future<Map<String, dynamic>?> registrar({
    required String correo,
    required String password,
    required String usuario,
    bool rol = false,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: correo,
      password: password,
    );
    final uid = cred.user!.uid;

    try {
      await _guardarPerfil(
        uid: uid,
        correo: correo,
        usuario: usuario,
        rol: rol,
      );
    } catch (e) {
      // Rollback: si falla Firestore (ej. usuario repetido) se borra de Auth
      await cred.user!.delete();
      rethrow;
    }

    return obtenerPerfil();
  }

  /// Crea Usuarios/{uid} y reserva nombresUsuario/{usuario} en una
  /// transacción: o se crean los dos o no se crea ninguno.
  Future<void> _guardarPerfil({
    required String uid,
    required String correo,
    required String usuario,
    required bool rol,
  }) {
    return _db.runTransaction((tx) async {
      final refNombre = _nombres.doc(usuario);
      final existente = await tx.get(refNombre);

      if (existente.exists) {
        throw FirebaseAuthException(
          code: 'username-already-in-use',
          message: 'Ese nombre de usuario ya está en uso',
        );
      }

      tx.set(refNombre, {'uid': uid, 'correo': correo});
      tx.set(_usuarios.doc(uid), {
        'correo': correo,
        'rol': rol,
        'usuario': usuario,
      });
    });
  }

  // ───────────────────────── LOGIN ─────────────────────────

  Future<Map<String, dynamic>?> iniciarSesion({
    required String identificador,
    required String password,
  }) async {
    String correo;

    if (identificador.contains('@')) {
      correo = identificador;
    } else {
      // Un solo get al documento (sin listar usuarios)
      final doc = await _nombres.doc(identificador).get();
      final correoGuardado = doc.data()?['correo'] as String?;

      if (correoGuardado == null) {
        throw FirebaseAuthException(code: 'invalid-credential');
      }
      correo = correoGuardado;
    }

    await _auth.signInWithEmailAndPassword(email: correo, password: password);
    return obtenerPerfil();
  }

  // ───────────────────────── MICROSOFT ─────────────────────────

  Future<Map<String, dynamic>?> iniciarConMicrosoft() async {
    final provider = OAuthProvider('microsoft.com');
    provider.setCustomParameters({
      'tenant': 'TU_TENANT_ID', // reemplázalo por el real
      'prompt': 'select_account',
    });
    provider.addScope('email');
    provider.addScope('profile');

    final UserCredential cred;
    try {
      cred = await _auth.signInWithProvider(provider);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw FirebaseAuthException(
          code: e.code,
          message: 'Ya existe una cuenta con ese correo. Entra con tu contraseña y vincula Microsoft desde tu perfil.',
        );
      }
      rethrow;
    }

    final user = cred.user!;
    final correo =
        user.email ??
        (user.providerData.isNotEmpty ? user.providerData.first.email : null);

    // Aquí no hay formulario, por eso el dominio se revisa en el servicio
    if (correo == null || !correo.endsWith('@$_dominio')) {
      if (cred.additionalUserInfo?.isNewUser == true) {
        await user.delete();
      } else {
        await _auth.signOut();
      }
      throw FirebaseAuthException(
        code: 'invalid-domain',
        message: 'Debes usar tu correo institucional',
      );
    }

    final ref = _usuarios.doc(user.uid);
    if (!(await ref.get()).exists) {
      final base = (user.displayName?.trim().isNotEmpty == true)
          ? user.displayName!.trim()
          : correo.split('@').first;

      // Si el nombre ya existe, se le agrega un sufijo del uid
      var nombre = base;
      if ((await _nombres.doc(nombre).get()).exists) {
        nombre = '$base${user.uid.substring(0, 4)}';
      }

      await _guardarPerfil(
        uid: user.uid,
        correo: correo,
        usuario: nombre,
        rol: false,
      );
    }

    return obtenerPerfil();
  }

  // ───────────────────────── OTROS ─────────────────────────

  Future<void> cerrarSesion() => _auth.signOut();

  Future<Map<String, dynamic>?> obtenerPerfil() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;
    final doc = await _usuarios.doc(uid).get();
    return doc.data();
  }
  
  Stream<Perfil?> perfilActual() {
    return _auth.authStateChanges().asyncExpand((user) {
      if (user == null) return Stream.value(null);

      return _usuarios.doc(user.uid).snapshots().map((doc) {
        final data = doc.data();
        if (data == null) return null;
        return Perfil.fromMap(user.uid, data);
      });
    });
  }

  /// Convierte el código de error en un mensaje para mostrar al usuario
  static String mensajeError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Ese correo ya está registrado';
      case 'username-already-in-use':
        return 'Ese nombre de usuario ya está en uso';
      case 'weak-password':
        return 'La contraseña es muy débil';
      case 'invalid-domain':
        return 'Debes usar tu correo institucional';
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return 'Usuario o contraseña incorrectos';
      case 'too-many-requests':
        return 'Demasiados intentos. Intenta más tarde';
      case 'network-request-failed':
        return 'Sin conexión a internet';
      case 'account-exists-with-different-credential':
        return e.message ?? 'Ya existe una cuenta con ese correo';
      case 'popup-closed-by-user':
      case 'canceled':
        return 'Inicio de sesión cancelado';
      default:
        return 'Ocurrió un error. Intenta de nuevo';
    }
  }
}
