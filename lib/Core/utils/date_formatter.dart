import 'package:intl/intl.dart';

class DateFormatter {
  static String format(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date);
  }
}
