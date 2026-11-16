class Perfil {
  final String uid;
  final String correo;
  final String usuario;
  final bool rol; // true = docente, false = estudiante

  const Perfil({
    required this.uid,
    required this.correo,
    required this.usuario,
    required this.rol,
  });

  bool get esDocente => rol;
  bool get esEstudiante => !rol;

  factory Perfil.fromMap(String uid, Map<String, dynamic> data) {
    return Perfil(
      uid: uid,
      correo: data['correo'] as String? ?? '',
      usuario: data['usuario'] as String? ?? '',
      rol: data['rol'] as bool? ?? false,
    );
  }
}
