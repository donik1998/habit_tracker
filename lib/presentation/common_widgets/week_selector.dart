import 'package:flutter/material.dart';

class WeekSelector extends StatefulWidget {
  final ValueChanged<DateTimeRange> onWeekSelected;

  const WeekSelector({
    super.key,
    required this.onWeekSelected,
  });

  @override
  State<WeekSelector> createState() => _WeekSelectorState();
}

class _WeekSelectorState extends State<WeekSelector> {
  DateTimeRange _currentWeek = DateTimeRange(
    start: DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
    end: DateTime.now().add(Duration(days: 7 - DateTime.now().weekday)),
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
