import 'dart:ui';
import 'package:field_visit_app/app/core/utils/theme/base_color.dart';

class LightColors extends BaseColor {
  // Fondo general de la app
  @override
  Color get background => const Color(0xFFFFFFFF); // Blanco puro

  @override
  Color get onBackground => const Color(0xFF000000); // Texto principal sobre fondo

  // Superficies como cards, sheets, diálogos, etc.
  @override
  Color get surface => const Color(0xFFF5F5F5); // Gris muy claro

  @override
  Color get onSurface => const Color(0xFF212121); // Texto sobre superficies

  // Color primario: botones, enlaces, iconos activos, etc.
  @override
  Color get primary => const Color(0xFF6200EE); // Violeta Material Design

  @override
  Color get onPrimary => const Color(0xFFFFFFFF); // Texto sobre color primario

  // Color secundario: acentos, indicadores, componentes menores
  @override
  Color get secondary => const Color(0xFF03DAC6); // Verde agua (teal)

  @override
  Color get onSecondary => const Color(0xFF000000); // Texto sobre secundario

  // Colores de error y advertencia
  @override
  Color get error => const Color(0xFFB00020); // Rojo de error estándar

  @override
  Color get onError => const Color(0xFFFFFFFF); // Texto sobre fondo de error
}
