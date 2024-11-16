import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/habit_daily_progress_cell.dart';

class WeeklyHabitDetails extends StatelessWidget {
  final List<HabitProgressModel> selectedWeekProgressItems;
  final ValueChanged<int> onDone;
  final ValueChanged<int> onHalfDone;
  final ValueChanged<int> onNotDone;

  const WeeklyHabitDetails({
    super.key,
    required this.selectedWeekProgressItems,
    required this.onDone,
    required this.onHalfDone,
    required this.onNotDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: selectedWeekProgressItems.map((item) {
        final isToday = item.date.isAtSameMomentAs(DateTime.now());
        final isEmpty = item.isEmpty;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(''),
            Text(''),
            HabitDailyProgressCell(
              size: const Size(44, 44),
              item: item,
              onTap: item.date.isAfter(DateTime.now())
                  ? null
                  : () {
                      if (item.progressStatus == HabitProgressStatus.notStarted ||
                          item.progressStatus == HabitProgressStatus.initial) {
                        onHalfDone(item.id);
                      } else if (item.progressStatus == HabitProgressStatus.halfDone) {
                        onDone(item.id);
                      } else {
                        onNotDone(item.id);
                      }
                    },
            ),
          ],
        );
      }).toList(),
    );
  }
}
