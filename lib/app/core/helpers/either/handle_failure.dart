import 'package:field_visit_app/app/core/helpers/failure.dart';
import 'package:field_visit_app/app/core/utils/failure_view_data.dart';
import 'package:flutter/material.dart';

FailureViewData mapFailureToView(Failure failure) {
  switch (failure) {
    case NetworkFailure():
      return const FailureViewData(
        icon: Icons.wifi_off,
        message: 'Sin conexión a internet',
      );
    case TimeoutFailure():
      return const FailureViewData(
        icon: Icons.timer_off,
        message: 'La solicitud ha expirado',
      );
    case ApiFailure(statusCode: final code, errorCode: final eCode):
      return FailureViewData(
        icon: Icons.cloud_off,
        message: 'Error del servidor (código: ${code ?? 'desconocido'})',
        errorCode: eCode,
      );
    case AuthFailure(errorCode: final eCode):
      return FailureViewData(
        icon: Icons.lock_outline,
        message: 'Autenticación fallida',
        errorCode: eCode,
      );
    case ValidationFailure(field: final fld, errorCode: final eCode):
      return FailureViewData(
        icon: Icons.warning_amber_outlined,
        message: 'Campo inválido: ${fld ?? "desconocido"}',
        errorCode: eCode,
      );
    case BusinessFailure(errorCode: final eCode):
      return FailureViewData(
        icon: Icons.business,
        message: failure.message,
        errorCode: eCode,
      );
    case NoDataFailure():
      return const FailureViewData(
        icon: Icons.info_outline,
        message: 'No hay datos disponibles',
      );
    case StorageFailure():
      return const FailureViewData(
        icon: Icons.sd_storage,
        message: 'Error de almacenamiento local',
      );
    case UnknownFailure(errorCode: final eCode):
      return FailureViewData(
        icon: Icons.error_outline,
        message: failure.message,
        errorCode: eCode,
      );
    case PermissionFailure():
      return FailureViewData(
        icon: Icons.error_outline,
        message: failure.message,
      );
    case GeolocatorFailure():
      return FailureViewData(
        icon: Icons.map_outlined,
        message: failure.message,
      );
  }
}
