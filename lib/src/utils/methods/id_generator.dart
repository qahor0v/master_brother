String generateID() {
  final DateTime dateTime = DateTime.now();
  final year = dateTime.year;
  final month = dateTime.month;
  final day = dateTime.day;
  final hour = dateTime.hour;
  final min = dateTime.minute;
  final sec = dateTime.second;
  final ms = dateTime.millisecond;
  final mcs = dateTime.microsecond;
  final id = "ID$year$month$day$hour$min$sec$ms$mcs";
  return id;
}
