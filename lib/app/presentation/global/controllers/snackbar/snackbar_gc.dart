import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/repositories/index_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import 'snackbar_state.dart';

final snackbarGP = Provider.state<SnackbarGC, SnackbarState>(
  (_) => SnackbarGC(
    SnackbarState.initialState,
    snackbarRepository: Repositories.snackbarRep.read(),
  ),
  autoDispose: false,
);

class SnackbarGC extends StateNotifier<SnackbarState> {
  SnackbarGC(
    super.initialState, {
    required SnackbarRepository snackbarRepository,
  }) : _snackbarRepository = snackbarRepository;

  final SnackbarRepository _snackbarRepository;

  void show(String message) {
    _snackbarRepository.showSnackbar(message);
  }

  void setContext(BuildContext context) {
    _snackbarRepository.setBuildContext(context);
  }
}
