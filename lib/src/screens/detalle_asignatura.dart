import 'package:flutter/material.dart';

class DocenteDetalleAsignaturaScreen extends StatelessWidget {
   const DocenteDetalleAsignaturaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Detalles de asignatura',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Ruta superior y estado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Expanded(
                  child: Text(
                    'Gestión Docente > Historial > BIO-401',
                    style: TextStyle(
                      color: Color(0xFF14532D),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color:  Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Text(
                    '● FINALIZADA',
                    style: TextStyle(
                      color: Color(0xFF14532D),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 12),

            // Tarjeta 1: Resumen General de la Asignatura
            Container(
              padding:  EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset:  Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'BIO-401 • Periodo 2024-2',
                    style: TextStyle(
                      color: Color(0xFF14532D),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                   SizedBox(height: 4),
                   Text(
                    'Biología Celular y Molecular',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF14532D),
                    ),
                  ),
                   SizedBox(height: 4),
                   Text(
                    'Licenciatura en Biología y Química • 38 Estudiantes',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                   SizedBox(height: 16),

                  // Cuadros de Estadísticas
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:  EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F8F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding:  EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:  Color(0xFFDCFCE7),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:  Icon(
                                  Icons.pie_chart_outline,
                                  color: Color(0xFF14532D),
                                  size: 20,
                                ),
                              ),
                               SizedBox(width: 10),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '92%',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Asistencia Global',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                       SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding:  EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F8F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding:  EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:  Icon(
                                  Icons.event_available,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                              ),
                               SizedBox(width: 10),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '16',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Sesiones Dictadas',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 14),

                  // Botones de acción (Exportar PDF y Ver Inasistencias)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            padding:  EdgeInsets.symmetric(vertical: 10),
                            side:  BorderSide(color: Color(0xFF14532D)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          icon:  Icon(
                            Icons.picture_as_pdf_outlined,
                            size: 16,
                            color: Color(0xFF14532D),
                          ),
                          label:  Text(
                            'Reporte PDF',
                            style: TextStyle(
                              color: Color(0xFF14532D),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                       SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF14532D),
                            foregroundColor: Colors.white,
                            padding:  EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => Navigator.pushNamed(
                            context,
                            "docenteInasistencias",
                          ),
                          icon:  Icon(
                            Icons.assignment_late_outlined,
                            size: 16,
                          ),
                          label:  Text(
                            'Inasistencias',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             SizedBox(height: 18),

            // Título de selector de sesiones
             Text(
              'Sesiones de Clase',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),

            // Selector horizontal de clases
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSessionChip('Clase #16 (18 Nov)', isSelected: true),
                   SizedBox(width: 8),
                  _buildSessionChip('Clase #15 (13 Nov)', isSelected: false),
                   SizedBox(width: 8),
                  _buildSessionChip('Clase #14 (11 Nov)', isSelected: false),
                ],
              ),
            ),
             SizedBox(height: 16),

            // Tarjeta 2: Detalle de Clase #16
            Container(
              padding:  EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset:  Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detalle: Clase #16',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '18 Nov 2024 • 06:00 - 08:00 AM • Aula 204',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ),
                      IconButton(
                        icon:  Icon(
                          Icons.download_outlined,
                          color: Color(0xFF14532D),
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                   SizedBox(height: 12),

                  // Mini-resumen: 35 Asistió | 2 Tarde | 1 Faltó
                  Row(
                    children: [
                      _buildMiniCounter('35', 'Asistió', Colors.green),
                       SizedBox(width: 8),
                      _buildMiniCounter('2', 'Tarde', Colors.orange),
                       SizedBox(width: 8),
                      _buildMiniCounter('1', 'Faltó', Colors.red),
                    ],
                  ),
                   SizedBox(height: 14),

                  // Buscador interno
                  Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F8F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Buscar estudiante en esta sesión...',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 12),

                  // Lista de estudiantes de la sesión
                  _buildAttendanceTile(
                    'CS',
                    'Carlos Mario Sterling',
                    'Cód. 20212004011 • 06:04 AM',
                    'Asistió',
                    Colors.green,
                  ),
                  _buildAttendanceTile(
                    'VG',
                    'Valentina Gómez Dussán',
                    'Cód. 20212004024 • 05:58 AM',
                    'Asistió',
                    Colors.green,
                  ),
                  _buildAttendanceTile(
                    'JC',
                    'Juan Rodrigo Caicedo',
                    'Cód. 20211003019 • 06:28 AM',
                    'Llegó Tarde',
                    Colors.orange,
                  ),
                  _buildAttendanceTile(
                    'DF',
                    'Diego Fernando Castro',
                    'Cód. 20212004077 • Sin registro',
                    'No Asistió',
                    Colors.red,
                  ),
                   SizedBox(height: 10),

                  // Enlace inferior
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child:  Text(
                        '+ Ver 34 estudiantes más de esta sesión',
                        style: TextStyle(
                          color: Color(0xFF14532D),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionChip(String label, {required bool isSelected}) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF14532D) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Color(0xFF14532D) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildMiniCounter(String count, String label, Color color) {
    return Expanded(
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceTile(
    String initials,
    String name,
    String subtitle,
    String status,
    Color color,
  ) {
    return Container(
      margin:  EdgeInsets.only(bottom: 8),
      padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.15),
            child: Text(
              initials,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
           SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                 SizedBox(height: 2),
                Text(
                  subtitle,
                  style:  TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
