import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toStringFormat(String format) {
    return DateFormat(format, "no").format(toLocal());
  }

  DateTime get dateWithoutTime {
    return DateTime(year, month, day);
  }

  DateTime get beginOfWeek {
    return this.subtract(Duration(days: weekday));
  }
}
