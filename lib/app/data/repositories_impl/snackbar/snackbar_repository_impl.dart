import 'package:field_visit_app/app/domain/repositories/snackbar/snackbar_repository.dart';
import 'package:flutter/material.dart';

class SnackbarRepositoryImpl extends SnackbarRepository {
  late BuildContext _context;

  @override
  void showSnackbar(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  void setBuildContext(BuildContext context) {
    _context = context;
  }
}
