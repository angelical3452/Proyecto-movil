import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../utils/validator_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKeyLogin = GlobalKey<FormState>();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
  bool _contraseniaObscure =
      true; // Variable para controlar la visibilidad de la contraseña
  bool _cargando = false;

  @override
  void dispose() {
    _usuarioController.dispose();
    _contraseniaController.dispose();
    super.dispose();
  }

  Future<void> _loginButton() async {
    if (!_formKeyLogin.currentState!.validate()) return;

    setState(() => _cargando = true);

    try {
      final perfil = await AuthService().iniciarSesion(
        identificador: _usuarioController.text,
        password: _contraseniaController.text,
      );

      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
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
        //appBar con el título de la aplicación
        title: Text(
          'Assistance App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        //safearea para evitar que el contenido se superponga con la barra de estado o la barra de navegación
        child: Padding(
          //padding para separar el contenido del borde de la pantalla
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            //singlechildscrollview para permitir el desplazamiento del contenido si es necesario
            child: Column(
              // column para organizar los widgets en una columna
              children: [
                Container(
                  // card / contenedor principal
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/unilogo.png',
                        width: 150,
                        height: 150,
                      ),
                      // Título de bienvenida
                      Title(
                        color: Color(0xFF006837),
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Color(0xFF006837),
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Serif',
                          ),
                        ),
                      ),
                      // Texto de bienvenida
                      Text(
                        'Ingresa con tu usuario y contraseña para Iniciar\nSesión',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4A4A4A), // Gris oscuro
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          height: 1.3, // Espaciado entre líneas
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Form(
                        key: _formKeyLogin,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          // Campos de usuario y contraseña
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Usuario',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "Ej. u20241029",
                                  style: TextStyle(
                                    color: Color(0xFF4A4A4A),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            TextFormField(
                              controller: _usuarioController,
                              validator: ValidatorForm.ValidateUsername,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Ingrese su usuario',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                filled: true,
                                fillColor: Color(0xFFF3F4F0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xFF898F99),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 17,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Contraseña Institucional',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            TextFormField(
                              controller: _contraseniaController,
                              validator: ValidatorForm.ValidateLoginPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _contraseniaObscure,
                              decoration: InputDecoration(
                                hintText: '******',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _contraseniaObscure =
                                          !_contraseniaObscure;
                                    });
                                  },
                                  icon: Icon(
                                    _contraseniaObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF3F4F0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xFF898F99),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 17,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  'recuperar_contrasenia',
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '¿Olvidaste tu contraseña?',
                                    style: TextStyle(
                                      color: Color(0xFF005E26),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                    color: Color(0xFF005E26),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                if (!_cargando) {
                                  _loginButton();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 17.0,
                                  horizontal: 15.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.login, size: 20.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Ingresar',
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
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 90.0,
                            child: Divider(
                              color: Color(0xFFE7E9E5),
                              thickness: 3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'O CONTINÚA CON',
                              style: TextStyle(
                                color: Color(0xFF827A80),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90.0,
                            child: Divider(
                              color: Color(0xFFE7E9E5),
                              thickness: 3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF3F4F0),
                          foregroundColor: Color(0xFF007A33),
                          padding: EdgeInsets.symmetric(
                            vertical: 17.0,
                            horizontal: 15.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.apartment, size: 20.0),
                            SizedBox(width: 10.0),
                            Text(
                              'Ingresar con Correo Institucional',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        '¿No tienes una cuenta activa?',
                        style: TextStyle(
                          color: Color(0xFF4A4A4A),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'registro');
                        },
                        child: Text(
                          'Regístrate como nuevo usuario',
                          style: TextStyle(
                            color: Color(0xFF006837),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Términos y Privacidad',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        Icons.circle,
                        size: 6.0,
                        color: Color(0xFFA2B9A8),
                      ),
                    ),
                    Text(
                      'Soporte Institucional',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Sistema Integral de Control de Asistencia © Universidad de la Amazonia',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4A4A4A),
                    fontSize: 14.0,
                    height: 1.3,
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
