import 'package:flutter/material.dart';

class EstudianteHomeScreen extends StatelessWidget {
  const EstudianteHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // SliverFillRemaining permite que la tarjeta "Próxima Clase"
          // quede abajo (Spacer) sin romper el scroll en pantallas pequeñas.
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'MÓDULOS ACADÉMICOS',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3A4A3E),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),

                  // ---------- Mis Asignaturas ----------
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFE3EDE6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.menu_book_outlined,
                              size: 34,
                              color: Color(0xFF005A2B),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mis Asignaturas',
                                  style: TextStyle(
                                    fontFamily: 'serif',
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1C1C1C),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Consulta materias matriculadas, horarios, aulas y registro oficial de asistencia.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                    color: Color(0xFF3F463F),
                                  ),
                                ),
                                SizedBox(height: 14),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE9EBE5),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Text(
                                    '5 Asignaturas',
                                    style: TextStyle(
                                      fontSize: 13,
                                      letterSpacing: 0.3,
                                      color: Color(0xFF3F463F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 26,
                              color: Color(0xFF005A2B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // ---------- Historial de Clases ----------
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFE3EDE6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.history,
                              size: 34,
                              color: Color(0xFF005A2B),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Historial de Clases',
                                  style: TextStyle(
                                    fontFamily: 'serif',
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1C1C1C),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Registro detallado de asistencias, sesiones anteriores y bitácora académica cumplida.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                    color: Color(0xFF3F463F),
                                  ),
                                ),
                                SizedBox(height: 14),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE9EBE5),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Text(
                                    '96% Asistencia Global',
                                    style: TextStyle(
                                      fontSize: 13,
                                      letterSpacing: 0.3,
                                      color: Color(0xFF3F463F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 26,
                              color: Color(0xFF005A2B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Empuja la tarjeta de próxima clase hacia abajo
                  Spacer(),
                  SizedBox(height: 32),

                  // ---------- Próxima clase hoy ----------
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 24,
                              color: Color(0xFF005A2B),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Próxima Clase Hoy',
                                style: TextStyle(
                                  fontFamily: 'serif',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1C1C1C),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFD5F8D9),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'En 45 min',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF005A2B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F2EC),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Ecología del Paisaje Amazónico',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1C1C1C),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '14:00 - 16:00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF005A2B),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Prof. Carlos Mendez • Aula 302 Edif. Yari',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF555B55),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Presencial',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF555B55),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
