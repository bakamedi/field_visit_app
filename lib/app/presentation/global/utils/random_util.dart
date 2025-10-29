import 'dart:math';

class RandomUtil {
  RandomUtil._();

  static int getRandomCode() {
    final random = Random();
    return 10000 + random.nextInt(90000);
  }
}
