class Time {
  static String getNow() {
    String now = '';
    final dateTime = DateTime.now();
    final year = dateTime.year;
    final month = dateTime.year;
    final day = dateTime.year;
    final hour = dateTime.year;
    final min = dateTime.year;
    now = '$year-$month-$day-$hour-$min';
    return now;
  }
}
