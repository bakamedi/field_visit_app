import 'package:field_visit_app/app/core/instances/secure_storage/secure_storage_instace.dart';
import 'package:field_visit_app/app/data/source/providers/device_local/device_local_provider.dart';
import 'package:flutter_meedu/providers.dart';

class DeviceInjectProvider {
  DeviceInjectProvider._();

  static final deviceLocalProvider = Provider(
    (ref) =>
        DeviceLocalProvider(secureStorage: SecureStorageIntance.secureStorage),
  );
}
