import 'package:flutter/material.dart';

class EstudianteHistorialScreen extends StatelessWidget {
  const EstudianteHistorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF14532D)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Historial',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xFF14532D),
                  child: Text(
                    'LG',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[400],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Row(
              children: [
                Text(
                  'PORTAL ESTUDIANTE',
                  style: TextStyle(
                    color: Color(0xFF14532D),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                Text(
                  '  >  Historial Académico',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'Registro de asignaturas concluidas y periodos cursados',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
            SizedBox(height: 16),

            // Tarjeta de Desempeño Global
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.menu_book,
                      color: Color(0xFF14532D),
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DESEMPEÑO GLOBAL',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '16 asignaturas cursadas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                        hintText: 'Buscar asignatura, docente o código...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Filtros de periodos
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('Todos 16', isSelected: true),
                  SizedBox(width: 8),
                  _buildFilterChip('2024-2', isSelected: false),
                  SizedBox(width: 8),
                  _buildFilterChip('2024-1', isSelected: false),
                  SizedBox(width: 8),
                  _buildFilterChip('2023-2', isSelected: false),
                  SizedBox(width: 8),
                  _buildFilterChip('2023-1', isSelected: false),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Lista de Asignaturas Históricas
            _buildHistoryCard(
              context,
              period: '2024-2',
              title: 'Biología Celular y Molecular',
              prof: 'Lic. en Biología y Química • Prof. Carlos Me...',
              code: 'Cód: BIO-301',
            ),
            _buildHistoryCard(
              context,
              period: '2024-2',
              title: 'Botánica Sistemática y Taxonomía',
              prof: 'Lic. en Biología y Química • Dra. Elena Pare...',
              code: 'Cód: BOT-304',
            ),
            _buildHistoryCard(
              context,
              period: '2024-1',
              title: 'Genética General y Aplicada',
              prof: 'Lic. en Biología y Química • Prof. Javier Rinc...',
              code: 'Cód: GEN-202',
            ),
            _buildHistoryCard(
              context,
              period: '2024-1',
              title: 'Bioquímica General',
              prof: 'Lic. en Biología y Química • Dra. Martha Luc...',
              code: 'Cód: BQ-201',
            ),
            _buildHistoryCard(
              context,
              period: '2023-2',
              title: 'Ecología de Poblaciones',
              prof: 'Lic. en Biología y Química • Prof. Fernando ...',
              code: 'Cód: ECO-210',
            ),
            _buildHistoryCard(
              context,
              period: '2023-2',
              title: 'Química Orgánica II',
              prof: 'Lic. en Biología y Química • Dra. Patricia Gó...',
              code: 'Cód: QMC-205',
            ),
            _buildHistoryCard(
              context,
              period: '2023-1',
              title: 'Física Biológica',
              prof: 'Lic. en Biología y Química • Mg. Andrés Cai...',
              code: 'Cód: FIS-112',
            ),
            _buildHistoryCard(
              context,
              period: '2022-2',
              title: 'Morfología Vegetal',
              prof: 'Lic. en Biología y Química • Prof. Hernán Be...',
              code: 'Cód: MOR-101',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {required bool isSelected}) {
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

  Widget _buildHistoryCard(
    BuildContext context, {
    required String period,
    required String title,
    required String prof,
    required String code,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () =>
              Navigator.pushNamed(context, "estudianteDetalleHistorico"),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          period,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        prof,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 2),
                      Text(
                        code,
                        style: TextStyle(
                          color: Color(0xFF14532D),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F8F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: Color(0xFF14532D),
                    size: 20,
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
