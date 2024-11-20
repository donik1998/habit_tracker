import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/habit_detailed_card.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/habit_weekly_details.dart';
import 'package:habit_tracker/utils/date_time_range_extension.dart';

class WeeklyTilesList extends StatelessWidget {
  final List<HabitModel> habits;
  final void Function(int habitProgressId, int habitId) onDone;
  final void Function(int habitProgressId, int habitId) onHalfDone;
  final void Function(int habitProgressId, int habitId) onNotDone;
  final ValueNotifier<DateTimeRange> selectedWeekNotifier;

  const WeeklyTilesList({
    super.key,
    required this.habits,
    required this.onDone,
    required this.onHalfDone,
    required this.onNotDone,
    required this.selectedWeekNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: habits
          .map(
            (habit) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: HabitDetailedCard(
                habit: habit,
                content: ValueListenableBuilder(
                  valueListenable: selectedWeekNotifier,
                  builder: (context, value, child) {
                    final selectedWeekProgressItems = habit.progress
                        .where((item) =>
                            item.date.isSameDayOrAfter(value.start) &&
                            item.date.isSameDayOrBefore(value.end))
                        .toList();
                    final additionalProgressItems = List.generate(
                      7 - selectedWeekProgressItems.length,
                      (index) => HabitProgressModel.empty(),
                    );

                    return WeeklyHabitDetails(
                      selectedWeekProgressItems: [
                        ...selectedWeekProgressItems,
                        ...additionalProgressItems,
                      ],
                      onDone: (habitProgressId) => onDone(habitProgressId, habit.id),
                      onHalfDone: (habitProgressId) => onHalfDone(habitProgressId, habit.id),
                      onNotDone: (habitProgressId) => onNotDone(habitProgressId, habit.id),
                    );
                  },
                ),
                showDates: false,
              ),
            ),
          )
          .toList(),
    );
  }
}
