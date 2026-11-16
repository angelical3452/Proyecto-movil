import 'package:flutter/material.dart';

class EstudianteMisAsignaturasScreen extends StatelessWidget {
  const EstudianteMisAsignaturasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Mis Asignaturas',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      // Contenido:
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Ruta superior
            Row(
              children: [
                Text(
                  'Portal Estudiante',
                  style: TextStyle(
                    color: Color(0xFF14532D),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '  >  Cursos Inscritos',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              'Mis Asignaturas Inscritas',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.circle, size: 8, color: Color(0xFF14532D)),
                SizedBox(width: 6),
                Text(
                  'Semestre Académico 2025-1 • Vigente',
                  style: TextStyle(
                    color: Color(0xFF14532D),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Tarjetas de estadísticas superiores (Materias y Asistencia)
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MATERIAS',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '5 activas',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.menu_book,
                            color: Color(0xFF14532D),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ASISTENCIA',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '94% Global',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF14532D),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.assignment_turned_in,
                            color: Color(0xFF14532D),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Buscador
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar por materia, código o docente...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Asignatura 1 (En curso con botón de QR)
            _buildSubjectCard(
              context,
              statusBadge: 'EN CURSO • BIO-502',
              timeBadge: 'Hoy 06:00 AM',
              title: 'Biología y Ecosistemas Amazónicos',
              prof: 'Prof. Carlos Mendoza',
              program: 'Licenciatura en Biología y Química',
              schedule: 'Lun y Mié 06:00 - 08:00 AM',
              location: 'Aula 204 (Campus Porvenir)',
              progressText: '95% (15 de 16 sesiones)',
              progressValue: 0.95,
              progressColor: Color(0xFF14532D),
              isPrimaryAction: true,
            ),

            // Asignatura 2
            _buildSubjectCard(
              context,
              statusBadge: 'EN CURSO • AGRO-310',
              timeBadge: 'Mañana Mar 08:00 AM',
              title: 'Ecología y Conservación de Flora Silvestre',
              prof: 'Dra. Martha Cecilia Rivas',
              program: 'Ingeniería Agroecológica',
              schedule: 'Mar y Jue 08:00 - 10:00 AM',
              location: 'Lab. Macagual (Sede Campestre)',
              progressText: '100% (12 de 12 sesiones)',
              progressValue: 1.0,
              progressColor: Color(0xFF14532D),
              isPrimaryAction: false,
            ),

            // Asignatura 3 (Con alerta de Límite permitido)
            _buildSubjectCard(
              context,
              statusBadge: 'EN CURSO • BIO-401',
              timeBadge: 'Miércoles 10:00 AM',
              title: 'Biología Celular y Molecular',
              prof: 'Prof. Hernando Ramírez',
              program: 'Licenciatura en Biología y Química',
              schedule: 'Mié y Vie 10:00 AM - 12:00 M',
              location: 'Aula 102 (Edificio Principal)',
              progressText: '88% (14 de 16)',
              progressValue: 0.88,
              progressColor: Colors.orange,
              warningLabel: 'Límite permitido',
              isPrimaryAction: false,
            ),

            // Asignatura 4
            _buildSubjectCard(
              context,
              statusBadge: 'EN CURSO • QMC-220',
              timeBadge: 'Jueves 02:00 PM',
              title: 'Bioquímica Vegetal y de Suelos',
              prof: 'Prof. Angela María Gómez',
              program: 'Química Pura / Bioquímica',
              schedule: 'Jue 02:00 PM - 06:00 PM',
              location: 'Laboratorio Central Bloque B',
              progressText: '92% (11 de 12 sesiones)',
              progressValue: 0.92,
              progressColor: Color(0xFF14532D),
              isPrimaryAction: false,
            ),

            // Tarjeta de Reglamento Estudiantil
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.info_outline,
                      color: Color(0xFF14532D),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reglamento Estudiantil',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'El porcentaje mínimo de asistencia para aprobación es del 80%. Para presentar justificaciones médicas o de fuerza mayor, contacta a la oficina de Bienestar Universitario dentro de los 5 días hábiles.',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            height: 1.3,
                          ),
                        ),
                      ],
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

  Widget _buildSubjectCard(
    BuildContext context, {
    required String statusBadge,
    required String timeBadge,
    required String title,
    required String prof,
    required String program,
    required String schedule,
    required String location,
    required String progressText,
    required double progressValue,
    required Color progressColor,
    String? warningLabel,
    required bool isPrimaryAction,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(top: BorderSide(color: Color(0xFF14532D), width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  statusBadge,
                  style: TextStyle(
                    color: Color(0xFF14532D),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 11, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      timeBadge,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.school_outlined, size: 14, color: Colors.grey),
              SizedBox(width: 6),
              Text(prof, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Text(program, style: TextStyle(color: Colors.grey, fontSize: 11)),
          SizedBox(height: 12),

          // Caja interna de horario y ubicación
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFF6F8F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: Color(0xFF14532D),
                    ),
                    SizedBox(width: 8),
                    Text(
                      schedule,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Color(0xFF14532D),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),

          // Barra de progreso de asistencia
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Asistencia acumulada',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Row(
                children: [
                  if (warningLabel != null) ...[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        warningLabel,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                  ],
                  Text(
                    progressText,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: progressColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              minHeight: 6,
            ),
          ),
          SizedBox(height: 14),

          // Botón de acción inferior
          SizedBox(
            width: double.infinity,
            child: isPrimaryAction
                ? ElevatedButton.icon(
                    onPressed: () =>
                        Navigator.pushNamed(context, "estudianteDetalle"),
                    icon: Icon(Icons.qr_code_scanner, size: 18),
                    label: Text(
                      'Registrar Asistencia QR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  )
                : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, "estudianteDetalle"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Color(0xFF14532D),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Ver Horario y Sesiones',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: Color(0xFF14532D),
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
