import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snackbar_state.freezed.dart';

@freezed
abstract class SnackbarState with _$SnackbarState {
  const SnackbarState._();

  const factory SnackbarState({BuildContext? context}) = _SnackbarState;

  static SnackbarState get initialState => const SnackbarState();
}
