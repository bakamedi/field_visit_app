import 'package:field_visit_app/app/domain/repositories/permission/permission_repository.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class PermissionRepositoryImpl implements PermissionRepository {
  const PermissionRepositoryImpl();

  @override
  Future<bool> checkPermission(ph.Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  @override
  Future<bool> requestPermission(ph.Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }

  @override
  Future<bool> isPermissionGranted(ph.Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  @override
  Future<void> openAppSettings() async {
    await ph.openAppSettings();
  }
}
