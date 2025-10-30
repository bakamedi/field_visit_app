import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageIntance {
  SecureStorageIntance._();

  static final secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
    ),
  );
}
