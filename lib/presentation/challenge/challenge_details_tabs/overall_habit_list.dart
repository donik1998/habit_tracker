import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/habit_detailed_card.dart';

class OverallTilesList extends StatelessWidget {
  final List<HabitModel> habits;
  final void Function(int habitProgressId, int habitId) onDone;
  final void Function(int habitProgressId, int habitId) onHalfDone;
  final void Function(int habitProgressId, int habitId) onNotDone;

  const OverallTilesList({
    super.key,
    required this.habits,
    required this.onDone,
    required this.onHalfDone,
    required this.onNotDone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: habits
          .map(
            (habit) => HabitDetailedCard(
              habit: habit,
              showDates: false,
              onProgressChanged: (habitProgressId, progress) {
                if (progress == HABIT_PROGRESS_COMPLETED) {
                  onDone(habitProgressId, habit.id);
                } else if (progress == HABIT_PROGRESS_HALF_DONE) {
                  onHalfDone(habitProgressId, habit.id);
                } else if (progress == HABIT_PROGRESS_NOT_DONE) {
                  onNotDone(habitProgressId, habit.id);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
