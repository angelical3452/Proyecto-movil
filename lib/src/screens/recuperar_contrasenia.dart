import 'package:flutter/material.dart';

import '../widgets/logo_seguridad.dart';
import '../utils/validator_form.dart';

class RecuperarContraseniaScreen extends StatefulWidget {
  const RecuperarContraseniaScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RecuperarContraseniaScreenState();
}

class _RecuperarContraseniaScreenState
    extends State<RecuperarContraseniaScreen> {
  final _formKeyRecuperar = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperación De Acceso', style: TextStyle(fontSize: 24)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  LogoSeguridad(size: 130.0),
                  SizedBox(height: 20.0),
                  Text(
                    'Recuperar contraseña',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B2A38),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text.rich(
                    TextSpan(
                      text: 'Ingresa tu correo institucional registrado\n(',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2D3748),
                        height: 1.35,
                        letterSpacing: 0.2,
                      ),
                      children: [
                        TextSpan(
                          text: '@udla.edu.co',
                          style: TextStyle(
                            color: Color(0xFF006837),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '). Te enviaremos un código\nde seguridad para restablecer tu acceso.',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Correo institucional',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B2A38),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Form(
                    key: _formKeyRecuperar,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: ValidatorForm.ValidateEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'usuario@udla.edu.co',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(
                              Icons.alternate_email_rounded,
                              color: Color(0xFF6F7A6D),
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
                              vertical: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 17.0,
                              horizontal: 15.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send_outlined, size: 20.0),
                              SizedBox(width: 10.0),
                              Text(
                                'Enviar enlace de recuperación',
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F6F3),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0xFFE2EBE4), width: 1.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Color(0xFF006837),
                          size: 24.0,
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Información importante',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1B2A38),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Text(
                                'Por protocolos de ciberseguridad, los enlaces expiran automáticamente tras 5 minutos de su emisión.',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF4A5568),
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
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
                        Icon(
                          Icons.arrow_back,
                          color: Color(0xFF006837),
                          size: 18.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Volver al inicio de sesión',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF006837),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
