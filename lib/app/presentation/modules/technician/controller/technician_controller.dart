import 'package:field_visit_app/app/core/defs/type_defs.dart';
import 'package:field_visit_app/app/core/helpers/either/either.dart';
import 'package:field_visit_app/app/core/helpers/failure.dart';
import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/models/success.dart';
import 'package:field_visit_app/app/domain/repositories/index_repositories.dart';
import 'package:field_visit_app/app/presentation/modules/technician/controller/technician_state.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:permission_handler/permission_handler.dart';

final technicianProvider =
    Provider.state<TechnicianController, TechnicianState>(
      (_) => TechnicianController(
        TechnicianState.initialState,
        permissionRepository: Repositories.permissionRep.read(),
        userRepository: Repositories.userRep.read(),
      ),
    );

class TechnicianController extends StateNotifier<TechnicianState> {
  TechnicianController(
    super.initialState, {
    required PermissionRepository permissionRepository,
    required UserRepository userRepository,
  }) : _permissionRepository = permissionRepository,
       _userRepository = userRepository {
    checkLocationPermission();
  }

  final PermissionRepository _permissionRepository;
  final UserRepository _userRepository;

  FutureEither<Failure, Result> checkCameraPermission() async {
    final cameraGranted = await _permissionRepository.requestPermission(
      Permission.camera,
    );
    if (!cameraGranted) {
      return Either.left(PermissionFailure('Permiso de cámara denegado'));
    }
    await _userRepository.updatePermission(
      resultsPermission: {'camera': cameraGranted},
    );
    return Either.right(const Success());
  }

  FutureEither<Failure, Result> checkLocationPermission() async {
    final cameraGranted = await _permissionRepository.requestPermission(
      Permission.locationWhenInUse,
    );
    if (!cameraGranted) {
      return Either.left(PermissionFailure('Permiso de location denegado'));
    }
    await _userRepository.updatePermission(
      resultsPermission: {'location': cameraGranted},
    );
    return Either.right(const Success());
  }
}
