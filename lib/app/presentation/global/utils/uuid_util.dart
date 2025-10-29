import 'package:uuid/uuid.dart';

class UuidUtil {
  UuidUtil._();
  static String generateUuid() {
    return Uuid().v1();
  }
}
