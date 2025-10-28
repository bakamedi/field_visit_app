import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import 'snackbar_state.dart';

final snackbarGP = Provider.state<SnackbarGC, SnackbarState>(
  (_) => SnackbarGC(SnackbarState.initialState),
);

class SnackbarGC extends StateNotifier<SnackbarState> {
  SnackbarGC(super.initialState);

  void show(String message) {}

  void setContext(BuildContext context) {}
}
