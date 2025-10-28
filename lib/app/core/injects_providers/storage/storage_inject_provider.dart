import 'package:field_visit_app/app/core/instances/secure_storage/secure_storage_instace.dart';
import 'package:field_visit_app/app/data/source/providers/storage/storage_provider.dart';
import 'package:flutter_meedu/providers.dart';

class StorageInjectProvider {
  StorageInjectProvider._();

  static final storageInjectProvider = Provider(
    (ref) => StorageProvider(secureStorage: SecureStorageIntance.secureStorage),
  );
}
