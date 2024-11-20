extension DateTimeExtension on DateTime {
  bool isSameDayOrAfter(DateTime other) {
    return isSameDay(other) || isAfter(other);
  }

  bool isSameDayOrBefore(DateTime other) {
    return isSameDay(other) || isBefore(other);
  }

  bool isSameDay(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }
}
