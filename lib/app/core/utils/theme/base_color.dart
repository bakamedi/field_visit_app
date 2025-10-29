import 'dart:ui';

abstract class BaseColor {
  Color get background;
  Color get onBackground;

  Color get surface;
  Color get onSurface;

  Color get primary;
  Color get onPrimary;

  Color get secondary;
  Color get onSecondary;

  // Errores
  Color get error;
  Color get onError;
}
