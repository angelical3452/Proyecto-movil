import 'package:flutter/material.dart';

import '../widgets/avatar.dart';

class DocenteInasistenciasScreen extends StatelessWidget {
  const DocenteInasistenciasScreen({super.key});

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
              'Inasistencias Y Justificaciones',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 17,
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
            Text(
              'PERÍODO ACADÉMICO 2025-1',
              style: TextStyle(
                color: Color(0xFF14532D),
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Gestión de Inasistencias',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 14),

            // Filtros de pestañas
            Row(
              children: [
                _buildTabChip('Pendientes (2)', isSelected: true),
                SizedBox(width: 8),
                _buildTabChip('Aprobadas', isSelected: false),
                SizedBox(width: 8),
                _buildTabChip('Rechazadas', isSelected: false),
              ],
            ),
            SizedBox(height: 16),

            // Tarjeta 1: Pendiente
            _buildJustificationCard(
              name: 'Juan Camilo Salazar',
              code: 'Cód. 20212004018',
              course: 'Arquitectura de Software',
              date: 'Lunes 24 Feb, 2025 • 08:00 AM',
              file: 'soporte_medico_eps.pdf',
              status: 'Pendiente',
              statusColor: Colors.red,
            ),

            // Tarjeta 2: Pendiente
            _buildJustificationCard(
              name: 'María Fernanda Gómez',
              code: 'Cód. 20212004045',
              course: 'Ecología y Desarrollo Sostenible',
              date: 'Viernes 21 Feb, 2025 • 02:00 PM',
              file: 'concepto_favorable_bienestar.pdf',
              status: 'Pendiente',
              statusColor: Colors.red,
            ),

            // Tarjeta 3: Aprobada
            _buildJustificationCard(
              name: 'Diego Fernando Castro',
              code: 'Cód. 20212004077',
              course: 'Bases de Datos Avanzadas',
              date: 'Jueves 20 Feb, 2025 • 10:00 AM',
              file: 'resolucion_vicerrectoria.pdf',
              status: 'Aprobada',
              statusColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabChip(String label, {required bool isSelected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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

  Widget _buildJustificationCard({
    required String name,
    required String code,
    required String course,
    required String date,
    required String file,
    required String status,
    required Color statusColor,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    code,
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(height: 1),
          SizedBox(height: 10),
          Text(
            course,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Color(0xFF14532D),
            ),
          ),
          SizedBox(height: 2),
          Text(date, style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 12),

          // Caja de archivo PDF adjunto
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFF6F8F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.picture_as_pdf, color: Colors.red, size: 22),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    file,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Icon(Icons.visibility_outlined, size: 18, color: Colors.grey),
              ],
            ),
          ),

          // Botones de acción si está pendiente
          if (status == 'Pendiente') ...[
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Rechazar',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF14532D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Aprobar',
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
        ],
      ),
    );
  }
}
