import 'package:uuid/uuid.dart';

class UuidUtil {
  UuidUtil._();
  static String generateUuid() {
    return const Uuid().v1();
  }
}
