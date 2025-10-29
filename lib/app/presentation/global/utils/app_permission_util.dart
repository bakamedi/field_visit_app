import 'package:collection/collection.dart';
import 'package:permission_handler/permission_handler.dart';

enum AppPermissionUtil {
  notifications,
  location,
  camera,
  photos;

  static const _nativeMap = {
    AppPermissionUtil.notifications: Permission.notification,
    AppPermissionUtil.location: Permission.location,
    AppPermissionUtil.camera: Permission.camera,
    AppPermissionUtil.photos: Permission.photos,
  };

  static const _keys = {
    AppPermissionUtil.notifications: 'notifications',
    AppPermissionUtil.location: 'location',
    AppPermissionUtil.camera: 'camera',
    AppPermissionUtil.photos: 'photos',
  };

  Permission get native => _nativeMap[this]!;

  String get key => _keys[this]!;

  static AppPermissionUtil? fromNative(Permission permission) {
    return _nativeMap.entries
        .firstWhereOrNull((e) => e.value == permission)
        ?.key;
  }
}
