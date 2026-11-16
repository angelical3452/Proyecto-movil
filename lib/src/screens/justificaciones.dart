import 'package:flutter/material.dart';

import '../widgets/avatar.dart';

class EstudianteJustificarScreen extends StatelessWidget {
  const EstudianteJustificarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black26,
        toolbarHeight: 80,
        titleSpacing: 20,
        title: Row(
          children: [
            Text(
              'Justificar Inasistencias',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
           Spacer(),
            MyAvatar(),
          ],
        ),
      ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Encabezado periodo y título
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ESTADO DE ASISTENCIA',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '4 Inasistencias Activas',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '● Período 2025-1',
                    style: TextStyle(
                      color: Color(0xFF14532D),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Alerta de plazo reglamentario
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.red, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plazo reglamentario vigente',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Dispones de 5 días hábiles posteriores a la fecha de la falta para adjuntar incapacidad EPS o soporte de fuerza mayor avalado.',
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
            SizedBox(height: 16),

            // Pestañas de filtro horizontales
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabChip('Pendientes (3)', isSelected: true),
                  SizedBox(width: 8),
                  _buildTabChip('En Revisión (1)', isSelected: false),
                  SizedBox(width: 8),
                  _buildTabChip('Aprobadas', isSelected: false),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Tarjeta 1: Vence en 24h
            _buildAbsenceCard(
              badge: 'VENCE EN 24H',
              badgeColor: Colors.red,
              title: 'Ecología y Desarrollo Soste...',
              prof: 'Prof. Carlos Eduardo Meneses Ocampo',
              date: 'Lunes 24 Feb, 2025 • 08:00 AM - 10:00 AM',
              location: 'Campus Porvenir • Edificio Macagual - Au...',
              progressText: '2 de 6 permitidas',
              progressValue: 0.33,
              warningText: 'Próxima falta causará pérdida por inasistencia reglamentaria.',
              actionButtonText: 'Justificar Inasistencia',
              isPrimary: true,
            ),

            // Tarjeta 2: Plazo 3 días
            _buildAbsenceCard(
              badge: 'PLAZO: 3 DÍAS',
              badgeColor: Colors.grey,
              title: 'Arquitectura de Software',
              prof: 'Dra. Martha Liliana Gómez P.',
              date: 'Miércoles 26 Feb, 2025 • 10:00 AM - 12:00 M',
              location: 'Campus Porvenir • Sala de Cómputo 3 (Li...',
              progressText: '1 de 8 permitidas',
              progressValue: 0.12,
              actionButtonText: 'Justificar Inasistencia',
              isPrimary: true,
            ),

            // Tarjeta 3: Soporte Radicado
            _buildAbsenceCard(
              badge: 'SOPORTE RADICADO • EN VALIDACIÓN',
              badgeColor: Colors.green,
              title: 'Bases de Datos Avanzadas',
              prof: 'Ing. Roberto Trujillo Caicedo',
              date: 'Viernes 21 Feb, 2025 • 02:00 PM - 04:00 PM',
              location: 'Campus Centro • Bloque C - Laboratorio 1...',
              radicadoNumber: 'RAD-2025-09842',
              radicadoStatus: 'En revisión por Secretaría',
              actionButtonText: 'Ver Comprobante Radicado (PDF)',
              isPrimary: false,
            ),

            // Tarjeta 4: Plazo 4 días
            _buildAbsenceCard(
              badge: 'PLAZO: 4 DÍAS',
              badgeColor: Colors.grey,
              title: 'Cálculo Integral',
              prof: 'Lic. Álvaro Narváez',
              date: 'Jueves 27 Feb, 2025 • 06:00 AM - 08:00 AM',
              location: 'Campus Porvenir • Bloque A - Aula 105',
              progressText: '1 de 8 permitidas',
              progressValue: 0.12,
              actionButtonText: 'Justificar Inasistencia',
              isPrimary: true,
            ),
            SizedBox(height: 10),

            // Sección de Requisitos de Validez
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified, color: Color(0xFF14532D), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Requisitos de Validez',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    'De acuerdo con el Reglamento Estudiantil de la Universidad de la Amazonia, solo serán aceptadas las siguientes justificaciones:',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 12),
                  _buildRequirementTile(
                    icon: Icons.medical_services_outlined,
                    title: 'Incapacidad Médica EPS / IPS',
                    subtitle: 'Con firma y registro médico. No se admiten recetas simples o fórmulas.',
                  ),
                  SizedBox(height: 8),
                  _buildRequirementTile(
                    icon: Icons.home_outlined,
                    title: 'Calamidad Doméstica Comprobada',
                    subtitle: 'Soporte documental validado ante la Coordinación de Programa.',
                  ),
                  SizedBox(height: 8),
                  _buildRequirementTile(
                    icon: Icons.emoji_events_outlined,
                    title: 'Comisión Oficial Deportiva o Cultural',
                    subtitle: 'Resolución emitida por Bienestar Universitario o Rectoría.',
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

  Widget _buildTabChip(String label, {required bool isSelected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF14532D) : Colors.white,
        borderRadius: BorderRadius.circular(20),
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

  Widget _buildAbsenceCard({
    required String badge,
    required Color badgeColor,
    required String title,
    required String prof,
    required String date,
    required String location,
    String? progressText,
    double? progressValue,
    String? warningText,
    String? radicadoNumber,
    String? radicadoStatus,
    required String actionButtonText,
    required bool isPrimary,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: badgeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              Icon(
                isPrimary ? Icons.assignment_late : Icons.inventory_2,
                color: badgeColor,
                size: 18,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.person_outline, size: 14, color: Colors.grey),
              SizedBox(width: 6),
              Text(prof, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              SizedBox(width: 6),
              Text(date, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          if (progressText != null && progressValue != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Acumulado materia:',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                Text(
                  progressText,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                minHeight: 5,
              ),
            ),
          ],

          if (warningText != null) ...[
            SizedBox(height: 6),
            Text(
              warningText,
              style: TextStyle(
                fontSize: 10,
                color: Colors.red,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],

          if (radicadoNumber != null && radicadoStatus != null) ...[
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF6F8F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Radicado Oficial',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      Text(
                        radicadoNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    radicadoStatus,
                    style: TextStyle(
                      color: Color(0xFF14532D),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],

          SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: isPrimary
                ? ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF14532D),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.upload_file, size: 18),
                    label: Text(
                      actionButtonText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  )
                : OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_outlined,
                      size: 18,
                      color: Color(0xFF14532D),
                    ),
                    label: Text(
                      actionButtonText,
                      style: TextStyle(
                        color: Color(0xFF14532D),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF14532D), size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
