import 'package:flutter/material.dart';

abstract class SnackbarRepository {
  void setBuildContext(BuildContext context);
  void showSnackbar(String message);
}
