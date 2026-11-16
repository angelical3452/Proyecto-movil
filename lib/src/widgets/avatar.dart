import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class MyAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return // Avatar + menú desplegable
    PopupMenuButton<String>(
      offset:  Offset(0, 56),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 8,
      constraints:  BoxConstraints(minWidth: 280),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) {
        // 'perfil' | 'config' | 'logout'
      },
      itemBuilder: (context) => [
         PopupMenuItem<String>(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prof. Carlos Mendoza',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'c.mendoza@uniamazonia.edu.co',
                style: TextStyle(fontSize: 13, color: Color(0xFF555B55)),
              ),
            ],
          ),
        ),
         PopupMenuDivider(height: 1),
        PopupMenuItem<String>(
          value: 'perfil',
          onTap: () => Navigator.pushNamed(context, "perfil"),
          height: 56,
          child: Row(
            children: [
              Icon(Icons.person_outline, size: 22, color: Color(0xFF005A2B)),
              SizedBox(width: 14),
              Text(
                'Mi perfil',
                style: TextStyle(fontSize: 16, color: Color(0xFF1C1C1C)),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'config',
          onTap: () => Navigator.pushNamed(context, "configuracion"),
          height: 56,
          child: const Row(
            children: [
              Icon(Icons.settings_outlined, size: 22, color: Color(0xFF555B55)),
              SizedBox(width: 14),
              Text(
                'Configuración',
                style: TextStyle(fontSize: 16, color: Color(0xFF1C1C1C)),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          onTap: () {
            AuthService().cerrarSesion();
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          value: 'logout',
          height: 56,
          child: Row(
            children: [
              Icon(Icons.logout, size: 22, color: Color(0xFFD50000)),
              SizedBox(width: 14),
              Text(
                'Cerrar sesión',
                style: TextStyle(fontSize: 16, color: Color(0xFFD50000)),
              ),
            ],
          ),
        ),
      ],
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:  Color(0xFFD5F8D9),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color:  Color(0xFFA8E6B0)),
            ),
            child:  Text(
              'CM',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF005A2B),
              ),
            ),
          ),
          Positioned(
            right: -3,
            bottom: -3,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color:  Color(0xFF5E9E6E),
                shape: BoxShape.circle,
                border: Border.all(color:  Color(0xFFF6F8F3), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
