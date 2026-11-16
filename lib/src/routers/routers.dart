import 'package:flutter/material.dart';

import '../screens/crear_asignatura.dart';
import '../screens/historial_estudiante.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/recuperar_contrasenia.dart';
import '../screens/registro.dart';
import '../screens/perfil.dart';
import '../screens/configuracion.dart';
import '../screens/ver_asignaturas_prof.dart';
import '../screens/detalle_asignaturaes.dart';
import '../screens/detalle_asignatura.dart';
import '../screens/inasistencia_justificaciones.dart';
import '../screens/detalle_estudiante.dart';
import '../screens/historial_asignaturas.dart';
import '../screens/asignaturas_inscritas.dart';

Map<String, WidgetBuilder> getAplicationRouter() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => LoginScreen(),
    "registro": (BuildContext context) => RegistroScreen(),
    "recuperar_contrasenia": (BuildContext context) =>
        RecuperarContraseniaScreen(),
    "home": (BuildContext context) => HomeScreen(),
    "perfil": (BuildContext context) => PerfilScreen(),
    "configuracion": (BuildContext context) => ConfiguracionScreen(),
    "crear_asignatura": (BuildContext context) => CrearAsignaturaScreen(),
    "ver_asignaturas_prof": (BuildContext context) =>
        VerAsignaturasProfScreen(),
    "estudianteDetalle": (BuildContext context) =>
        EstudianteDetalleAsignaturaScreen(),
    "docenteDetalle": (BuildContext context) =>
        DocenteDetalleAsignaturaScreen(),
    "docenteInasistencias": (BuildContext context) =>
        DocenteInasistenciasScreen(),
    "estudianteDetalleHistorico": (BuildContext context) =>
        EstudianteDetalleHistoricoScreen(),
    "docenteHistorial" : (BuildContext context) => DocenteHistorialScreen(),
    "asignaturasEstudiante" : (BuildContext context ) => EstudianteMisAsignaturasScreen(),
    "historialEstudiante" :(BuildContext context) => EstudianteHistorialScreen(),
  };
}
