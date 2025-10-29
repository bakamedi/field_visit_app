import 'dart:ui';
import 'package:field_visit_app/app/core/utils/theme/base_color.dart';

class DarkColors extends BaseColor {
  @override
  Color get background => const Color(0xFF181818);

  @override
  Color get onBackground => const Color(0xFFE0E0E0);

  @override
  Color get surface => const Color(0xFF1E1E1E);

  @override
  Color get onSurface => const Color(0xFFCCCCCC);

  @override
  Color get primary => const Color(0xFFBB86FC);

  @override
  Color get onPrimary => const Color(0xFF000000);

  @override
  Color get secondary => const Color(0xFF03DAC6);

  @override
  Color get onSecondary => const Color(0xFF000000);

  @override
  Color get error => const Color(0xFFCF6679);

  @override
  Color get onError => const Color(0xFF000000);
}
