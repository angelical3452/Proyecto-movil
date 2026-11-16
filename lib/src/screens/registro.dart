import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../widgets/medidor_seguridad.dart';
import '../utils/validator_form.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKeyRegistro = GlobalKey<FormState>();
  // controladores para los campos de texto
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
  final TextEditingController _confirmcontraseniaController =
      TextEditingController();
  bool rol = false; // Variable para almacenar el rol seleccionado (false = estudiante, true = docente)
  bool aceptado = false;
  bool _contraseniaObscure =
      true; // Variable para controlar la visibilidad de la contraseña
  bool _contraseniaObscure1 = true; // Variable para controlar la visibilidad de la confirmación de contraseña
  double _contraseniaStrength = 0.0;
  bool _cargando = false;

  // metodo para limpiar los controladores cuando se destruye el widget
  @override
  void dispose() {
    _usuarioController.dispose();
    _emailController.dispose();
    _contraseniaController.dispose();
    _confirmcontraseniaController.dispose();
    super.dispose();
  }

  void _limpiarFormulario() {
    _formKeyRegistro.currentState?.reset();
    _usuarioController.clear();
    _emailController.clear();
    _contraseniaController.clear();
    _confirmcontraseniaController
        .clear(); // cambia al nombre real de tu controller
    setState(() {
      rol = false;
      aceptado = false;
      _contraseniaStrength = 0.0; // si usas el medidor de seguridad
    });
  }

  Future<void> _registerButton() async {
    if (!_formKeyRegistro.currentState!.validate()) return;

    if (!aceptado) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes aceptar los términos y condiciones'),
        ),
      );
      return;
    }

    setState(() => _cargando = true);

    try {
      await AuthService().registrar(
        correo: _emailController.text.trim(),
        password: _contraseniaController.text,
        usuario: _usuarioController.text.trim(),
        rol: rol,
      );

      // Se cierra la sesión que Firebase abre automáticamente al registrar,
      // para que el usuario inicie sesión de forma manual.
      await AuthService().cerrarSesion();

      if (!mounted) return;
      _limpiarFormulario();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuenta creada. Inicia sesión')),
      );
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(AuthService.mensajeError(e))));
    } finally {
      if (mounted) setState(() => _cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // appbar con el titulo "Registrarse" y un estilo de fuente y tamaño
        title: Text(
          'Registrarse',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        // safearea para evitar que el contenido se superponga con la barra de estado o la barra de navegación
        child: Padding(
          // paddding para dar un margen interno de 16 pixeles a todos los lados
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // singlechildscrollview para permitir el desplazamiento vertical del contenido
            child: Column(
              // column para organizar los widgets en vertical
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crear Cuenta',
                  style: TextStyle(
                    fontFamily: 'Serif',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B2A38),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Ingresa tus credenciales oficiales para vincular tu\nperfil académico de forma segura.',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2D3748),
                    height: 1.35,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Selecciona tu rol en la institución',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B2A38),
                  ),
                ),
                SizedBox(height: 10.0),
                // contenedor para los botones de rol con un fondo gris claro y bordes redondeados, false es docente y true estudiante
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF3F4F0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                rol = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: rol
                                  ? Color(0xFFF3F4F0)
                                  : Color(0xFF007A33),
                              padding: EdgeInsets.symmetric(
                                vertical: 17.0,
                                horizontal: 15.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.school_outlined,
                                  size: 20.0,
                                  color: rol ? Colors.grey : Colors.white,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Estudiante',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: rol
                                        ? Color(0xFF1B2A38)
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                rol = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 17.0,
                                horizontal: 15.0,
                              ),
                              backgroundColor: !rol
                                  ? Color(0xFFF3F4F0)
                                  : Color(0xFF007A33),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.co_present_outlined,
                                  size: 20.0,
                                  color: !rol ? Colors.grey : Colors.white,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Docente',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: !rol
                                        ? Color(0xFF1B2A38)
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Form(
                  // form para validar los campos de texto
                  key: _formKeyRegistro,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nombre de Usuario',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B2A38),
                            ),
                          ),
                          Text(
                            'Obligatorio',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _usuarioController,
                        validator: ValidatorForm.ValidateUsername,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Ej. camilo123',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.badge_outlined,
                            color: Colors.grey,
                            size: 25,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF898F99)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Correo Electrónico Institucional',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B2A38),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFB4F1BE),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alternate_email,
                                    size: 12,
                                    color: Color(0xFF287A4E),
                                  ),
                                  SizedBox(width: 1.0),
                                  Text(
                                    '@udla.edu.co',
                                    style: TextStyle(
                                      color: Color(0xFF287A4E),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _emailController,
                        validator: ValidatorForm.ValidateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'tu.nombre@udla.edu.co',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.grey,
                            size: 25,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF898F99)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.info_outline_rounded,
                              size: 16.0,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          SizedBox(width: 6.0),
                          Expanded(
                            child: Text(
                              'Debe ser tu dirección institucional activa para validar\ncuenta.',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xFF2D3748),
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Contraseña Institucional',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B2A38),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _contraseniaController,
                        validator: ValidatorForm.ValidateRegisterPassword,
                        onChanged: (value) {
                          setState(() {
                            _contraseniaStrength =
                                ValidatorForm.PasswordStrength(value);
                          });
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _contraseniaObscure,
                        decoration: InputDecoration(
                          hintText:
                              'Mínimo 8 caracteres, una mayúscula y un número',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.grey,
                            size: 25,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _contraseniaObscure = !_contraseniaObscure;
                              });
                            },
                            icon: Icon(
                              _contraseniaObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF898F99)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      MedidorSeguridad(value: _contraseniaStrength),
                      SizedBox(height: 10.0),
                      Text(
                        'Confirmar contraseña',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B2A38),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _confirmcontraseniaController,
                        validator: ValidatorForm.ValidateConfirmPassword(
                          _contraseniaController.text,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _contraseniaObscure1,
                        decoration: InputDecoration(
                          hintText: 'Repite la contraseña',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.verified_user_outlined,
                            color: Colors.grey,
                            size: 25,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _contraseniaObscure1 = !_contraseniaObscure1;
                              });
                            },
                            icon: Icon(
                              _contraseniaObscure1
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF898F99)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F7F5), // Fondo gris/verde tenue
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: aceptado,
                                onChanged: (v) => setState(() => aceptado = v!),
                                activeColor: const Color(0xFF3F7D58),
                                checkColor: Colors.white,
                                fillColor: WidgetStateProperty.resolveWith(
                                  (states) =>
                                      states.contains(WidgetState.selected)
                                      ? const Color(0xFF3F7D58)
                                      : Colors.white, // fondo blanco cuando está vacío
                                ),
                                side: const BorderSide(
                                  color: Color(0xFFA9BDB0),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFF2D3748),
                                      height: 1.35,
                                    ),
                                    children: [
                                      TextSpan(text: 'Acepto el '),
                                      TextSpan(
                                        text:
                                            'Reglamento Académico Estudiantil',
                                        style: TextStyle(
                                          color: Color(0xFF00875A),
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' y la política de tratamiento de datos personales de la institución.',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: _cargando ? null : _registerButton,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 17.0,
                            horizontal: 15.0,
                          ),
                        ),
                        child: _cargando
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.how_to_reg, size: 20.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Crear Cuenta',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Align(
                  child: Text(
                    '¿Ya tienes una cuenta institucional?',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ),
                SizedBox(height: 3.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar sesión aquí',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF007A33),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF007A33),
                        size: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
