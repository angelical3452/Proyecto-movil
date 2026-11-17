import 'package:flutter/material.dart';

import '../widgets/avatar.dart';

class VerAsignaturasProfScreen extends StatefulWidget {
  const VerAsignaturasProfScreen({super.key});

  @override
  State<VerAsignaturasProfScreen> createState() =>
      _VerAsignaturasProfScreenState();
}

class _VerAsignaturasProfScreenState extends State<VerAsignaturasProfScreen> {
  final _searchController = TextEditingController();
  int _selectedFilter = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filters = [
      'Todos (4)',
      'Lic. Biología',
      'Ing. Agroecológica',
      'Med. Veterinaria',
    ];

    // Datos de ejemplo de las tarjetas (reemplazar por tu modelo)
    final classes = <Map<String, dynamic>>[
      {
        'code': 'BIO-502',
        'tag': 'Hoy 10:00 AM',
        'tagIcon': Icons.alarm,
        'isToday': true,
        'title': 'Biología y Ecosistemas Amazónicos',
        'programIcon': Icons.apartment,
        'program': 'Licenciatura en Biología y Química (BIO-502)',
        'students': '34 matriculados',
        'schedule': 'Lun y Mié 06:00-08:00 AM • Aula 204',
        'topColor': Color(0xFF005A2B),
      },
      {
        'code': 'AGRO-310',
        'tag': 'Mañana Mar',
        'tagIcon': Icons.calendar_today_outlined,
        'isToday': false,
        'title': 'Ecología y Conservación de Flora Silvestre',
        'programIcon': Icons.park_outlined,
        'program': 'Ingeniería Agroecológica (AGRO-310)',
        'students': '28 matriculados',
        'schedule': 'Mar y Jue 08:00-10:00 AM • Lab. Macagual',
        'topColor': Color(0xFF005A2B),
      },
      {
        'code': 'VET-401',
        'tag': 'Viernes',
        'tagIcon': Icons.calendar_today_outlined,
        'isToday': false,
        'title': 'Microbiología y Recursos Hídricos',
        'programIcon': Icons.pets,
        'program': 'Medicina Veterinaria y Zootecnia (VET-401)',
        'students': '31 matriculados',
        'schedule': 'Vie 07:00 - 11:00 AM • Aula 105',
        'topColor': Color(0xFF1F8A47),
      },
      {
        'code': 'LIC-520',
        'tag': 'Sábados',
        'tagIcon': Icons.calendar_today_outlined,
        'isToday': false,
        'title': 'Seminario de Investigación Amazónica',
        'programIcon': Icons.science_outlined,
        'program': 'Licenciatura en Ciencias Naturales (LIC-520)',
        'students': '25 matriculados',
        'schedule': 'Sáb 08:00 - 12:00 M • Aula Magistral',
        'topColor': Color(0xFF6FD68A),
      },
    ];

    return Scaffold(
      // ======================= APP BAR =======================
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black26,
        toolbarHeight: 80,
        titleSpacing: 20,
        title: Row(
          children: [
            Text(
              'Asignaturas',
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

      // ======================= BODY =======================
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 20),
          children: [
            // ---------- Breadcrumb ----------
            Row(
              children: [
                Icon(Icons.school_outlined, size: 14, color: Color(0xFF005A2B)),
                SizedBox(width: 4),
                Text(
                  'Gestión Docente',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF005A2B),
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.chevron_right, size: 14, color: Color(0xFF555B55)),
                SizedBox(width: 6),
                Text(
                  'Clases Activas',
                  style: TextStyle(fontSize: 12, color: Color(0xFF1C1C1C)),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              'Mis Clases Activas',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFF005A2B),
              ),
            ),
            SizedBox(height: 14),

            // ---------- Resumen (3 tarjetas) ----------
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.menu_book_outlined,
                              size: 16,
                              color: Color(0xFF005A2B),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'MATERIAS',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 0.4,
                                color: Color(0xFF555B55),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          '4',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Activas 2025',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF00843D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.groups_outlined,
                              size: 16,
                              color: Color(0xFF005A2B),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'TOTAL',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 0.4,
                                color: Color(0xFF555B55),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          '118',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Estudiantes',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF555B55),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.event_available_outlined,
                              size: 16,
                              color: Color(0xFFD50000),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'PERIODO',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 0.4,
                                color: Color(0xFF555B55),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          '2025-1',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'En curso',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF00843D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),

            // ---------- Buscador ----------
            TextField(
              controller: _searchController,
              style: TextStyle(fontSize: 15, color: Color(0xFF1C1C1C)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Buscar por materia o código...',
                hintStyle: TextStyle(fontSize: 15, color: Color(0xFF555B55)),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                prefixIcon: Icon(Icons.search, color: Color(0xFF555B55)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFE6E8E2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF00843D), width: 1.5),
                ),
              ),
            ),
            SizedBox(height: 12),

            // ---------- Filtros ----------
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(filters.length, (i) {
                  final selected = _selectedFilter == i;
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFilter = i),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? Color(0xFF005A2B)
                              : Color(0xFFE9EBE5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filters[i],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: selected ? Colors.white : Color(0xFF555B55),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 14),

            // ---------- Tarjetas de clases ----------
            ...classes.map(
              (c) => Container(
                margin: EdgeInsets.only(bottom: 14),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Borde superior de color
                    Container(height: 5, color: c['topColor'] as Color),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Etiquetas superiores
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFD5F8D9),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 7,
                                      color: Color(0xFF00843D),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'EN CURSO · ${c['code']}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        letterSpacing: 0.3,
                                        color: Color(0xFF1C1C1C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: (c['isToday'] as bool)
                                      ? Color(0xFFFFE9E9)
                                      : Color(0xFFF1F2EC),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: (c['isToday'] as bool)
                                        ? Color(0xFFFFB3B3)
                                        : Color(0xFFE0E3DC),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      c['tagIcon'] as IconData,
                                      size: 14,
                                      color: (c['isToday'] as bool)
                                          ? Color(0xFFC4001D)
                                          : Color(0xFF555B55),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      c['tag'] as String,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: (c['isToday'] as bool)
                                            ? Color(0xFFC4001D)
                                            : Color(0xFF555B55),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          // Título
                          Text(
                            c['title'] as String,
                            style: TextStyle(
                              fontFamily: 'serif',
                              fontSize: 26,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1C1C1C),
                            ),
                          ),
                          SizedBox(height: 8),

                          // Programa
                          Row(
                            children: [
                              Icon(
                                c['programIcon'] as IconData,
                                size: 18,
                                color: Color(0xFF005A2B),
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  c['program'] as String,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF3F463F),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),

                          // Caja de estudiantes
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F2EC),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.groups_outlined,
                                  size: 20,
                                  color: Color(0xFF3D7A52),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Estudiantes',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF555B55),
                                      ),
                                    ),
                                    Text(
                                      c['students'] as String,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1C1C1C),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),

                          // Caja de horario
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F2EC),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 20,
                                  color: Color(0xFF005A2B),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Horario y Lugar',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF555B55),
                                        ),
                                      ),
                                      Text(
                                        c['schedule'] as String,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF1C1C1C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),

                          // Botones
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      "docenteAsignatura",
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF005A2B),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.checklist,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Tomar Asistencia',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "docenteAsignatura",
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE9EBE5),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 22,
                                    color: Color(0xFF555B55),
                                  ),
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
            ),

            // ---------- Crear nueva asignatura ----------
            SizedBox(height: 6),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "crear_asignatura");
              },
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color: Color(0xFF005A2B),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Crear Nueva Asignatura',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '¿Necesitas vincular un grupo adicional? Consulta con la Vicerrectoría Académica.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                height: 1.4,
                color: Color(0xFF555B55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
