import 'package:flutter/material.dart';
import 'package:field_visit_app/app/core/utils/theme/base_color.dart';

class ButtonThemeApp {
  ButtonThemeApp._();
  static OutlinedButtonThemeData outlinedButtonThemeData(BaseColor baseColor) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(baseColor.background),
        foregroundColor: WidgetStateProperty.all<Color>(baseColor.onSurface),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return baseColor.primary.withAlpha((0.1 * 255).round());
          }
          return null;
        }),
        iconColor: WidgetStateProperty.resolveWith<Color>(
          (states) => baseColor.onSurface,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: baseColor.secondary, width: 1),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonThemeData(BaseColor baseColor) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(double.infinity, 50),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return baseColor.primary.withAlpha((0.4 * 255).round());
          }
          return baseColor.primary;
        }),
        foregroundColor: WidgetStateProperty.all<Color>(baseColor.onPrimary),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.focused) ||
              states.contains(WidgetState.pressed)) {
            return baseColor.onPrimary.withAlpha((0.1 * 255).round());
          }
          return null;
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 14),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        iconColor: WidgetStateProperty.resolveWith<Color>(
          (states) => baseColor.onPrimary,
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  static TextButtonThemeData textButtonThemeData(BaseColor baseColor) {
    return TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(const Size(40, 40)),
        backgroundColor: WidgetStateProperty.all<Color>(baseColor.surface),
        foregroundColor: WidgetStateProperty.all<Color>(baseColor.onSurface),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return baseColor.primary.withAlpha((0.1 * 255).round());
          }
          return null;
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.only(left: 5),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: baseColor.secondary, width: 1),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
