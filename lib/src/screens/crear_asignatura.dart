import 'package:flutter/material.dart';

import '../widgets/avatar.dart';

class CrearAsignaturaScreen extends StatefulWidget {
  const CrearAsignaturaScreen({super.key});

  @override
  State<CrearAsignaturaScreen> createState() => _CrearAsignaturaScreenState();
}

class _CrearAsignaturaScreenState extends State<CrearAsignaturaScreen> {
  final _nameController = TextEditingController(
    text: 'Biología y Ecosistemas Amazónicos',
  );
  final _programController = TextEditingController(
    text: 'Lic. en Biología y Química (BIO-502)',
  );

  String _period = '2025-1 (Semestre Vigente)';
  final Set<String> _selectedDays = {'Lun', 'Mié'};

  @override
  void dispose() {
    _nameController.dispose();
    _programController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'Crear Asignatura',
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
          padding: EdgeInsets.fromLTRB(16, 14, 16, 24),
          children: [
            // ---------- Breadcrumb ----------
            Row(
              children: [
                Icon(Icons.school_outlined, size: 14, color: Color(0xFF555B55)),
                SizedBox(width: 4),
                Text(
                  'Gestión Académica',
                  style: TextStyle(fontSize: 12, color: Color(0xFF555B55)),
                ),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 14, color: Color(0xFF555B55)),
                SizedBox(width: 4),
                Text(
                  'Nueva Materia',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF00843D),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Crear Asignatura',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xFF005A2B),
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Registra los datos académicos, horario y matrícula estudiantes.',
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
                color: Color(0xFF555B55),
              ),
            ),
            SizedBox(height: 18),

            // ================= 1. DATOS GENERALES =================
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFF005A2B),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.menu_book,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. Datos Generales',
                            style: TextStyle(
                              fontFamily: 'serif',
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1C1C1C),
                            ),
                          ),
                          Text(
                            'Identificación curricular del curso',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF555B55),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 18),

                  // Nombre de la asignatura
                  Text.rich(
                    TextSpan(
                      text: 'Nombre de la Asignatura / Curso ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1C1C),
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Color(0xFFD50000)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 15, color: Color(0xFF1C1C1C)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.auto_stories_outlined,
                        color: Color(0xFF555B55),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFE6E8E2)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF00843D),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Programa académico
                  Text.rich(
                    TextSpan(
                      text: 'Programa Académico / Código ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1C1C),
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Color(0xFFD50000)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _programController,
                    style: TextStyle(fontSize: 15, color: Color(0xFF1C1C1C)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.account_balance_outlined,
                        color: Color(0xFF555B55),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFE6E8E2)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF00843D),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Periodo académico
                  Text.rich(
                    TextSpan(
                      text: 'Periodo Académico ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1C1C),
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Color(0xFFD50000)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _period,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF555B55),
                    ),
                    style: TextStyle(fontSize: 15, color: Color(0xFF1C1C1C)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xFF555B55),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFE6E8E2)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF00843D),
                          width: 1.5,
                        ),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: '2025-1 (Semestre Vigente)',
                        child: Text('2025-1 (Semestre Vigente)'),
                      ),
                      DropdownMenuItem(value: '2025-2', child: Text('2025-2')),
                      DropdownMenuItem(value: '2026-1', child: Text('2026-1')),
                    ],
                    onChanged: (value) {
                      if (value != null) setState(() => _period = value);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),

            // ================= 2. ASIGNACIÓN DE HORARIO =================
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFF005A2B),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.schedule,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2. Asignación de Horario',
                            style: TextStyle(
                              fontFamily: 'serif',
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1C1C1C),
                            ),
                          ),
                          Text(
                            'Franjas y ubicación de cátedra',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF555B55),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Días de Cátedra',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1C1C),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Chips de días
                  Row(
                    children: ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb']
                        .map(
                          (day) => Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  if (_selectedDays.contains(day)) {
                                    _selectedDays.remove(day);
                                  } else {
                                    _selectedDays.add(day);
                                  }
                                }),
                                child: Container(
                                  height: 42,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _selectedDays.contains(day)
                                        ? Color(0xFF005A2B)
                                        : Color(0xFFF1F2EC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    day,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: _selectedDays.contains(day)
                                          ? Colors.white
                                          : Color(0xFF555B55),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 14),

                  // Franja 1
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEEE8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Color(0xFFD5E5D8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.meeting_room_outlined,
                            size: 22,
                            color: Color(0xFF3D7A52),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lunes: 06:00 AM – 08:00 AM',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1C1C1C),
                                ),
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                    color: Color(0xFF555B55),
                                  ),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      'Aula 204 • Campus Porvenir',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF555B55),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top: 28),
                            child: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: Color(0xFF555B55),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Franja 2
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEEE8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Color(0xFF3D7A52),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.science_outlined,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Miércoles: 02:00 PM – 04:00 PM',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1C1C1C),
                                ),
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                    color: Color(0xFF555B55),
                                  ),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      'Laboratorio Macagual • Bloque B',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF555B55),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top: 28),
                            child: Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: Color(0xFFC4001D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Añadir franja
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFFEBEEE8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 20,
                            color: Color(0xFF005A2B),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Añadir otra franja horaria',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF005A2B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),

            // ================= 3. MATRÍCULA Y ESTUDIANTES =================
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFF005A2B),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.group_add_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3. Matrícula y Estudiantes',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'serif',
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                            Text(
                              'Sincronización masiva vía Excel institucional',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF555B55),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Zona de carga
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEEE8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Color(0xFFD5E5D8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.table_chart_outlined,
                            size: 34,
                            color: Color(0xFF3D7A52),
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Cargar listado de estudiantes (.xlsx, .csv)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'El sistema leerá la columna del correo institucional (@udla.edu.co) para vincular automáticamente las cuentas registradas en la base de datos institucional.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFF555B55),
                          ),
                        ),
                        SizedBox(height: 14),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 11,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF005A2B),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.upload,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Examinar archivo',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),

                  // Archivo cargado + muestra
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEEE8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF005A2B),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'XLS',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'estudiantes_matricula_2025_1.xlsx',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1C1C1C),
                                    ),
                                  ),
                                  Text(
                                    '148 KB • Hace 2 minutos',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF555B55),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Muestra de estudiantes reconocidos:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF555B55),
                          ),
                        ),
                        SizedBox(height: 8),

                        // Estudiantes de muestra
                        ...[
                          {
                            'ini': 'VG',
                            'name': 'Valentina Gómez Dussán',
                            'mail': 'v.gomez@udla.edu.co',
                            'bg': Color(0xFF8DF0A0),
                            'fg': Color(0xFF005A2B),
                          },
                          {
                            'ini': 'JR',
                            'name': 'Juan Rodrigo Caicedo',
                            'mail': 'j.caicedo@udla.edu.co',
                            'bg': Color(0xFFD5F8D9),
                            'fg': Color(0xFF005A2B),
                          },
                          {
                            'ini': 'LT',
                            'name': 'Laura Tatiana Murillo',
                            'mail': 'l.murillo@udla.edu.co',
                            'bg': Color(0xFFFFD9D9),
                            'fg': Color(0xFFC4001D),
                          },
                        ].map(
                          (s) => Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: s['bg'] as Color,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    s['ini'] as String,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: s['fg'] as Color,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        s['name'] as String,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1C1C1C),
                                        ),
                                      ),
                                      Text(
                                        s['mail'] as String,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF555B55),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.how_to_reg_outlined,
                                  size: 20,
                                  color: Color(0xFF3D7A52),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '+ 31 estudiantes adicionales listos',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF555B55),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Ver lista\ncompleta',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF005A2B),
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
            SizedBox(height: 16),

            // ---------- Nota informativa ----------
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFE6EBE3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.cloud_sync_outlined,
                    size: 24,
                    color: Color(0xFF3D7A52),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Al confirmar, se creará el aula virtual Moodle correspondiente y se notificarán a los estudiantes a través de sus correos institucionales.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Color(0xFF555B55),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // ---------- Botón principal ----------
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color: Color(0xFF00843D),
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
                    Icon(Icons.save_outlined, size: 22, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Crear y Vincular Asignatura',
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
          ],
        ),
      ),
    );
  }
}
