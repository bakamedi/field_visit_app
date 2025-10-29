import 'package:permission_handler/permission_handler.dart';

abstract class PermissionRepository {
  Future<bool> checkPermission(Permission permission);
  Future<bool> requestPermission(Permission permission);
  Future<bool> isPermissionGranted(Permission permission);
  Future<void> openAppSettings();
}
