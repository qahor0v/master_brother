class Time {
  static String getNow() {
    String now = '';
    final dateTime = DateTime.now();
    final year = dateTime.year;
    final month = dateTime.month;
    final day = dateTime.day;
    final hour = dateTime.hour;
    final min = dateTime.minute;
    now = '$year-$month-$day-$hour-$min';
    return now;
  }

  static bool permission() {
    final DateTime now = DateTime.now();
    final hour = now.hour;
    //final minute = now.minute;
    if (hour < 6 && hour >= 0) {
      return false;
    } else {
      return true;
    }
  }
}
