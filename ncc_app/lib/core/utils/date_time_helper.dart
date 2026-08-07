import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateFromServer(String date) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
  }

  static String formatDateTimeFromServer(String date) {
    return DateFormat('yyyy-MM-dd HH:MM').format(DateTime.parse(date));
  }

  static int dateTimeToTimestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

  // get time from timestamp
  static DateTime timestampToDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  // to date only format dd-mm-yyyy
  static String toHuman(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String toServerDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
