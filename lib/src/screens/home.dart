import 'package:flutter/material.dart';

import '../models/Perfil.dart';
import '../services/auth_service.dart';
import '../widgets/avatar.dart';
import '../screens/home_docente.dart';
import '../screens/home_estudiante.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black26,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            Image.asset('assets/images/unilogo.png', width: 50, height: 50),
             Spacer(),
             Text(
              'Prof. Carlos Mendoza',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1C1C1C),
              ),
            ),
             SizedBox(width: 12),
            MyAvatar(),
          ],
        ),
      ),
      body: StreamBuilder<Perfil?>(
        stream: AuthService().perfilActual(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final perfil = snapshot.data;
          final esDocente = perfil?.rol ?? false;
          return esDocente ? HomeDocenteScreen(): EstudianteHomeScreen();
        },
      ),
    );
  }
}
