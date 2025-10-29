import 'package:field_visit_app/app/presentation/global/controllers/snackbar/snackbar_gc.dart';

abstract class SnackbarUtil {
  static final SnackbarGC snackbarGC = snackbarGP.read();

  static void showError(String message) {
    snackbarGC.show(message);
  }

  static void showSuccess(String message) {
    snackbarGC.show(message);
  }
}
