import 'package:field_visit_app/app/core/utils/theme/button_theme_app.dart';
import 'package:flutter/material.dart';
import 'dark_colors.dart';
import 'light_colors.dart';

class ThemeApp {
  // Singleton
  factory ThemeApp() => _instance;
  ThemeApp._();
  static final ThemeApp _instance = ThemeApp._();

  // Instancias de colores (no estáticos)
  static final _light = LightColors();
  static final _dark = DarkColors();

  /// Tema oscuro personalizado
  static ThemeData get darkTheme => ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _dark.background,
    primaryColor: _dark.primary,
    elevatedButtonTheme: ButtonThemeApp.elevatedButtonThemeData(_dark),
    textButtonTheme: ButtonThemeApp.textButtonThemeData(_dark),
    outlinedButtonTheme: ButtonThemeApp.outlinedButtonThemeData(_dark),
    colorScheme: ColorScheme.dark(
      surface: _dark.surface,
      onSurface: _dark.onSurface,
      primary: _dark.primary,
      onPrimary: _dark.onPrimary,
      secondary: _dark.secondary,
      onSecondary: _dark.onSecondary,
      error: _dark.error,
      onError: _dark.onError,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _dark.surface,
      foregroundColor: _dark.onSurface,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: _dark.onBackground),
      bodyMedium: TextStyle(color: _dark.onSurface),
    ),
    cardColor: _dark.surface,
  );

  /// Tema claro personalizado
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    scaffoldBackgroundColor: _light.background,
    primaryColor: _light.primary,
    elevatedButtonTheme: ButtonThemeApp.elevatedButtonThemeData(_light),
    textButtonTheme: ButtonThemeApp.textButtonThemeData(_light),
    outlinedButtonTheme: ButtonThemeApp.outlinedButtonThemeData(_light),
    colorScheme: ColorScheme.light(
      surface: _light.surface,
      onSurface: _light.onSurface,
      primary: _light.primary,
      onPrimary: _light.onPrimary,
      secondary: _light.secondary,
      onSecondary: _light.onSecondary,
      error: _light.error,
      onError: _light.onError,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _light.surface,
      foregroundColor: _light.onSurface,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: _light.onBackground),
      bodyMedium: TextStyle(color: _light.onSurface),
    ),
    cardColor: _light.surface,
  );
}
