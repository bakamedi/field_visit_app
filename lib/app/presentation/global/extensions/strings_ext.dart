import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension StringExt on String {
  bool get isValidEmail {
    return RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(this);
  }

  bool get isValidName {
    return RegExp(
      r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$",
    ).hasMatch(this);
  }

  bool get isValidPassword {
    return length >= 6;
  }

  String get getInitials {
    List<String> nameParts = split(' ');
    String initials = '';

    for (String part in nameParts) {
      initials += part.substring(0, 1);
    }

    return initials;
  }

  String concat(String cat) {
    return this + cat;
  }

  bool get maxLengthOtp => length == 4;

  String getFormattedDate() {
    DateTime date = DateTime.parse(this);

    String formattedDate = DateFormat('MM/dd/yyyy').format(date);

    return formattedDate;
  }

  String toRelativeTime({String locale = 'es'}) {
    try {
      final date = DateTime.parse(this);
      return timeago.format(date, locale: locale);
    } catch (e) {
      return 'Invalid date';
    }
  }
}
