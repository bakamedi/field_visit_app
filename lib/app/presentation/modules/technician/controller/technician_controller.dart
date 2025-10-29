import 'package:field_visit_app/app/domain/inject_repository.dart';
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
       _userRepository = userRepository;

  final PermissionRepository _permissionRepository;
  final UserRepository _userRepository;

  Future<void> checkPermission() async {
    final cameraGranted = await _permissionRepository.requestPermission(
      Permission.camera,
    );
    await _userRepository.updatePermission(
      resultsPermission: {'camera': cameraGranted},
    );
  }
}
