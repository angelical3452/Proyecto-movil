import 'package:flutter/material.dart';

class ConfiguracionScreen extends StatefulWidget {
   const ConfiguracionScreen({super.key});

  @override
  State<ConfiguracionScreen> createState() => _ConfiguracionScreenState();
}

class _ConfiguracionScreenState extends State<ConfiguracionScreen> {
  final _nameController = TextEditingController(text: 'Prof. Carlos Mendoza');
  final _currentPassController = TextEditingController(text: '••••••••••••');
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool _hideCurrent = true;
  bool _hideNew = true;
  bool _hideConfirm = true;
  bool _isDark = false;
  bool _reminders = true;

  @override
  void dispose() {
    _nameController.dispose();
    _currentPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Evaluación simple de la nueva contraseña
    final newPass = _newPassController.text;
    final hasMinLength = newPass.length >= 8;
    final hasAlphanumeric =
        RegExp(r'[A-Za-z]').hasMatch(newPass) &&
        RegExp(r'[0-9]').hasMatch(newPass);
    final strength = newPass.isEmpty
        ? 0
        : (hasMinLength ? 1 : 0) +
              (hasAlphanumeric ? 1 : 0) +
              (newPass.length >= 12 ? 1 : 0);
    final strengthLabel = strength == 0
        ? 'Sin evaluar'
        : strength == 1
        ? 'Débil'
        : strength == 2
        ? 'Media'
        : 'Fuerte';

    return Scaffold(
      // ======================= APP BAR =======================
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black26,
        toolbarHeight: 64,
        titleSpacing: 0,
        title:  Text(
          'Configuración',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1C1C1C),
          ),
        ),
        actions: [
          // Logo (reemplazar por Image.asset('assets/logo.png', height: 36))
          Container(
            width: 40,
            height: 36,
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
          padding:  EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            // ---------- Foto de perfil ----------
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    padding:  EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color:  Color(0xFF005A2B),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color:  Color(0xFF1F8A47),
                        width: 3,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      // Reemplazar por Image.asset / Image.network
                      child: Container(
                        color:  Color(0xFFD5F8D9),
                        child:  Icon(
                          Icons.person,
                          size: 64,
                          color: Color(0xFF005A2B),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color:  Color(0xFF005A2B),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Icon(
                        Icons.photo_camera_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 8),
            Center(
              child: Container(
                padding:  EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color:  Color(0xFFE4E7E1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 8, color: Color(0xFF3D7A52)),
                    SizedBox(width: 6),
                    Text(
                      'Docente Titular',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3D7A52),
                      ),
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(height: 6),
             Text(
              'JPG o PNG máx. 5MB. Fotografía\ninstitucional oficial recomendada.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Color(0xFF555B55),
              ),
            ),
             SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color:  Color(0xFFE4E7E1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Row(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: 20,
                          color: Color(0xFF005A2B),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Subir nueva foto',
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
                 SizedBox(width: 12),
                TextButton(
                  onPressed: () {},
                  child:  Text(
                    'Eliminar',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFC4001D),
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 24),

            // ---------- Datos de cuenta (encabezado) ----------
             Row(
              children: [
                Icon(Icons.circle, size: 10, color: Color(0xFF005A2B)),
                SizedBox(width: 8),
                Text(
                  'Datos de Cuenta',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1C1C1C),
                  ),
                ),
                Spacer(),
                Text(
                  'SIGA ACADÉMICO',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B716B),
                  ),
                ),
              ],
            ),
             SizedBox(height: 12),

            // ---------- Datos de cuenta (tarjeta) ----------
            Container(
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:  [
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
                   Text(
                    'Nombre de Usuario / Nombre Completo',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1C1C),
                    ),
                  ),
                   SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    style:  TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1C1C1C),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:  Color(0xFFF1F2EC),
                      contentPadding:  EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      prefixIcon:  Icon(
                        Icons.person_outline,
                        color: Color(0xFF555B55),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _nameController.clear()),
                        icon:  Icon(
                          Icons.cancel_outlined,
                          color: Color(0xFF555B55),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                   SizedBox(height: 16),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Correo Institucional (No modificable)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C1C1C),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.verified_outlined,
                            size: 16,
                            color: Color(0xFF005A2B),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Verificado',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF005A2B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                   SizedBox(height: 8),
                  TextFormField(
                    initialValue: 'c.mendoza@uniamazonia.edu.co',
                    readOnly: true,
                    style:  TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1C1C1C),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:  Color(0xFFF1F2EC),
                      contentPadding:  EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      prefixIcon:  Icon(
                        Icons.mail_outline,
                        color: Color(0xFF555B55),
                      ),
                      suffixIcon:  Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: Color(0xFF555B55),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 24),

            // ---------- Seguridad y contraseña ----------
            Container(
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:  [
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color:  Color(0xFF8DF0A0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Icon(
                          Icons.shield_outlined,
                          size: 22,
                          color: Color(0xFF005A2B),
                        ),
                      ),
                       SizedBox(width: 12),
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seguridad y Contraseña',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Actualiza periódicamente tu clave de acceso al portal institucional.',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.35,
                                color: Color(0xFF555B55),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 20),

                  // Contraseña actual
                   Text(
                    'Contraseña actual',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1C1C),
                    ),
                  ),
                   SizedBox(height: 8),
                  TextField(
                    controller: _currentPassController,
                    obscureText: _hideCurrent,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:  Color(0xFFF1F2EC),
                      contentPadding:  EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      prefixIcon:  Icon(
                        Icons.lock_outline,
                        color: Color(0xFF555B55),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _hideCurrent = !_hideCurrent),
                        icon: Icon(
                          _hideCurrent
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF555B55),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                   SizedBox(height: 16),

                  // Nueva contraseña
                   Text(
                    'Nueva contraseña',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1C1C),
                    ),
                  ),
                   SizedBox(height: 8),
                  TextField(
                    controller: _newPassController,
                    obscureText: _hideNew,
                    onChanged: (_) => setState(() {}),
                    style:  TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1C1C1C),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:  Color(0xFFF1F2EC),
                      hintText: 'Ingresa tu nueva contraseña',
                      hintStyle:  TextStyle(
                        fontSize: 16,
                        color: Color(0xFF555B55),
                      ),
                      contentPadding:  EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      prefixIcon:  Icon(
                        Icons.vpn_key_outlined,
                        color: Color(0xFF555B55),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _hideNew = !_hideNew),
                        icon: Icon(
                          _hideNew
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF555B55),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                   SizedBox(height: 10),

                  // Indicador de seguridad
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        'Seguridad:',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B716B),
                        ),
                      ),
                      Text(
                        strengthLabel,
                        style:  TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B716B),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: strength >= 1
                                ?  Color(0xFF00843D)
                                :  Color(0xFFE4E7E1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                       SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: strength >= 2
                                ?  Color(0xFF00843D)
                                :  Color(0xFFE4E7E1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                       SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: strength >= 3
                                ?  Color(0xFF00843D)
                                :  Color(0xFFE4E7E1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        hasMinLength
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        size: 18,
                        color: hasMinLength
                            ?  Color(0xFF00843D)
                            :  Color(0xFF6B716B),
                      ),
                       SizedBox(width: 6),
                       Text(
                        'Mínimo 8 caracteres',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B716B),
                        ),
                      ),
                       SizedBox(width: 20),
                      Icon(
                        hasAlphanumeric
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        size: 18,
                        color: hasAlphanumeric
                            ?  Color(0xFF00843D)
                            :  Color(0xFF6B716B),
                      ),
                       SizedBox(width: 6),
                       Text(
                        'Alfanumérico',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B716B),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 16),

                  // Confirmar contraseña
                   Text(
                    'Confirmar nueva contraseña',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1C1C),
                    ),
                  ),
                   SizedBox(height: 8),
                  TextField(
                    controller: _confirmPassController,
                    obscureText: _hideConfirm,
                    style:  TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1C1C1C),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:  Color(0xFFF1F2EC),
                      hintText: 'Reescribe tu nueva contraseña',
                      hintStyle:  TextStyle(
                        fontSize: 16,
                        color: Color(0xFF555B55),
                      ),
                      contentPadding:  EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      prefixIcon:  Icon(
                        Icons.password,
                        color: Color(0xFF555B55),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _hideConfirm = !_hideConfirm),
                        icon: Icon(
                          _hideConfirm
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF555B55),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                   SizedBox(height: 12),

                  // Botón actualizar contraseña
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color:  Color(0xFFE4E7E1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_reset,
                            size: 22,
                            color: Color(0xFF005A2B),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Actualizar Contraseña',
                            style: TextStyle(
                              fontSize: 14,
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
             SizedBox(height: 24),

            // ---------- Apariencia (encabezado) ----------
             Row(
              children: [
                Icon(Icons.circle, size: 10, color: Color(0xFF005A2B)),
                SizedBox(width: 8),
                Text(
                  'Apariencia',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1C1C1C),
                  ),
                ),
                Spacer(),
                Text(
                  'Personalización',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF005A2B),
                  ),
                ),
              ],
            ),
             SizedBox(height: 12),

            // ---------- Apariencia (tarjeta) ----------
            Container(
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:  [
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
                   Text(
                    'Tema de la Aplicación',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1C1C),
                    ),
                  ),
                   SizedBox(height: 6),
                   Text(
                    'Selecciona el modo visual para tus consultas de aula y notas.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Color(0xFF555B55),
                    ),
                  ),
                   SizedBox(height: 16),
                  Row(
                    children: [
                      // Modo claro
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isDark = false),
                          child: Container(
                            padding:  EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:  Color(0xFFF1F2EC),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: !_isDark
                                    ?  Color(0xFF005A2B)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child:  Icon(
                                        Icons.light_mode,
                                        size: 20,
                                        color: Color(0xFFE0A100),
                                      ),
                                    ),
                                    if (!_isDark)
                                       Icon(
                                        Icons.check_circle,
                                        size: 22,
                                        color: Color(0xFF005A2B),
                                      ),
                                  ],
                                ),
                                 SizedBox(height: 22),
                                 Text(
                                  'Modo Claro',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF1C1C1C),
                                  ),
                                ),
                                 SizedBox(height: 2),
                                 Text(
                                  'Predeterminado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF6B716B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                       SizedBox(width: 12),
                      // Modo oscuro
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isDark = true),
                          child: Container(
                            padding:  EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:  Color(0xFFF1F2EC),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: _isDark
                                    ?  Color(0xFF005A2B)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color:  Color(0xFF2B2B2B),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child:  Icon(
                                        Icons.dark_mode,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      _isDark
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      size: 22,
                                      color: _isDark
                                          ?  Color(0xFF005A2B)
                                          :  Color(0xFF6B716B),
                                    ),
                                  ],
                                ),
                                 SizedBox(height: 22),
                                 Text(
                                  'Modo Oscuro',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF1C1C1C),
                                  ),
                                ),
                                 SizedBox(height: 2),
                                 Text(
                                  'Alto descanso visual',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF6B716B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             SizedBox(height: 20),

            // ---------- Marcación de asistencia ----------
            Container(
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:  [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color:  Color(0xFFE4E7E1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child:  Icon(
                      Icons.how_to_reg_outlined,
                      size: 20,
                      color: Color(0xFF3D7A52),
                    ),
                  ),
                   SizedBox(width: 12),
                   Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marcación de Asistencia',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        Text(
                          'Recordatorios para firma de lista en cada sesión.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.35,
                            color: Color(0xFF555B55),
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(width: 8),
                  Switch(
                    value: _reminders,
                    onChanged: (value) => setState(() => _reminders = value),
                    activeColor: Colors.white,
                    activeTrackColor:  Color(0xFF005A2B),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor:  Color(0xFFC9CEC6),
                  ),
                ],
              ),
            ),
             SizedBox(height: 28),

            // ---------- Guardar / descartar ----------
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color:  Color(0xFF00843D),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow:  [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_outlined, size: 22, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Guardar Cambios',
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
             SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).maybePop(),
                child:  Text(
                  'Descartar cambios',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B716B),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
