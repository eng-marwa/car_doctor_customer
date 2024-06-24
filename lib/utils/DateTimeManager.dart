import 'package:intl/intl.dart';

class DateTimeManager {
  static String currentDateTime() {
    return DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now());
  }
}