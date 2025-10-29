import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/repositories/permission/permission_repository.dart';
import 'package:field_visit_app/app/presentation/modules/technician/controller/technician_state.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:permission_handler/permission_handler.dart';

final technicianProvider =
    Provider.state<TechnicianController, TechnicianState>(
      (_) => TechnicianController(
        TechnicianState.initialState,
        permissionRepository: Repositories.permissionRep.read(),
      ),
    );

class TechnicianController extends StateNotifier<TechnicianState> {
  TechnicianController(
    super.initialState, {
    required PermissionRepository permissionRepository,
  }) : _permissionRepository = permissionRepository;

  final PermissionRepository _permissionRepository;

  Future<void> checkPermission() async {
    await _permissionRepository.requestPermission(Permission.camera);
  }
}
