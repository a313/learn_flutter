import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toStringFormat(String format) {
    return DateFormat(format, "no").format(toLocal());
  }
}
