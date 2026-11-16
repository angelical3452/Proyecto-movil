import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PerfilScreen extends StatelessWidget {
   const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black26,
        toolbarHeight: 72,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon:  Icon(Icons.arrow_back, size: 28),
          color:  Color(0xFF005A2B),
        ),
        title:  Text(
          'Perfil Institucional',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1C1C1C),
          ),
        ),
        actions: [
          // Logo (reemplazar por Image.asset('assets/logo.png', height: 40))
          Container(
            width: 44,
            height: 40,
            margin:  EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color:  Color(0xFFD5F8D9),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Icon(Icons.school, color: Color(0xFF005A2B)),
          ),
        ],
      ),

      // ======================= BODY =======================
      body: SafeArea(
        child: ListView(
          padding:  EdgeInsets.fromLTRB(24, 12, 24, 24),
          children: [
            // ---------- Tarjeta de perfil ----------
            Container(
              padding:  EdgeInsets.all(20),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow:  [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Marca de agua decorativa
                   Positioned(
                    right: -30,
                    top: 10,
                    child: Icon(
                      Icons.eco_outlined,
                      size: 140,
                      color: Color(0xFFEEF3EC),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Foto de perfil + indicador de estado
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                padding:  EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color:  Color(0xFF005A2B),
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                    color:  Color(0xFF6FE08A),
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  // Reemplazar por Image.asset / Image.network
                                  child: Container(
                                    color:  Color(0xFFD5F8D9),
                                    child:  Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Color(0xFF005A2B),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: -4,
                                bottom: -4,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color:  Color(0xFF005A2B),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                           Spacer(),
                          // Etiqueta
                          Container(
                            padding:  EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:  Color(0xFFE4E7E1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child:  Text(
                              'DOCENTE TITULAR',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF005A2B),
                              ),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 18),
                       Text(
                        'Prof. Carlos Mendoza',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C1C1C),
                        ),
                      ),
                       SizedBox(height: 12),
                      // Fila del correo
                      Container(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color:  Color(0xFFF1F2EC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                             Icon(
                              Icons.mail_outline,
                              size: 22,
                              color: Color(0xFF005A2B),
                            ),
                             SizedBox(width: 10),
                             Expanded(
                              child: Text(
                                'c.mendoza@uniamazonia.edu.co',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1C1C1C),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                   ClipboardData(
                                    text: 'c.mendoza@uniamazonia.edu.co',
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    content: Text('Correo copiado'),
                                  ),
                                );
                              },
                              child:  Icon(
                                Icons.content_copy,
                                size: 22,
                                color: Color(0xFF005A2B),
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
             SizedBox(height: 20),

            // ---------- Estadísticas ----------
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:  EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow:  [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color:  Color(0xFFE3EEE4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Icon(
                            Icons.menu_book_outlined,
                            size: 22,
                            color: Color(0xFF005A2B),
                          ),
                        ),
                         SizedBox(height: 6),
                         Text(
                          '4',
                          style: TextStyle(
                            fontFamily: 'serif',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF005A2B),
                          ),
                        ),
                         Text(
                          'Materias Activas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF555B55),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding:  EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow:  [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color:  Color(0xFFE3EEE4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Icon(
                            Icons.schedule,
                            size: 22,
                            color: Color(0xFF005A2B),
                          ),
                        ),
                         SizedBox(height: 6),
                         Text(
                          '16h',
                          style: TextStyle(
                            fontFamily: 'serif',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF005A2B),
                          ),
                        ),
                         Text(
                          'Semanales',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF555B55),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 40),

            // ---------- Cerrar sesión ----------
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow:  [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 24, color: Color(0xFFC4001D)),
                    SizedBox(width: 8),
                    Text(
                      'Cerrar Sesión Institucional',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFC4001D),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
