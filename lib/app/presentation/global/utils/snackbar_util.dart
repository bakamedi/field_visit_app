import 'package:field_visit_app/app/presentation/global/controllers/snackbar/snackbar_gc.dart';
import 'package:flutter/material.dart';

abstract class SnackbarUtil {
  static final BuildContext? _context = snackbarGP.read().state.context;

  static void showError(String message) {
    if (_context == null) {
      return;
    }
    ScaffoldMessenger.of(_context!).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  static void showSuccess(String message) {
    // Implementation to show success snackbar
    ScaffoldMessenger.of(_context!).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}
