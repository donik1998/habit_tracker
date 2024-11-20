import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/tiles/challenge_habit_tile.dart';
import 'package:habit_tracker/presentation/common_widgets/titled_divider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';

class DailyHabitsTab extends StatelessWidget {
  final List<HabitModel> notCompletedTodayHabits;
  final List<HabitModel> completedTodayHabits;
  final ValueChanged<HabitModel> onDone;
  final ValueChanged<HabitModel> onHalfDone;
  final ValueChanged<HabitModel> onNotDone;

  const DailyHabitsTab({
    super.key,
    required this.notCompletedTodayHabits,
    required this.completedTodayHabits,
    required this.onDone,
    required this.onHalfDone,
    required this.onNotDone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...notCompletedTodayHabits.map(
          (habit) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Slidable(
              startActionPane: ActionPane(
                motion: const BehindMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => onNotDone(habit),
                    icon: Icons.not_interested_rounded,
                    backgroundColor: AppColors.red800,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                    label: LocaleKeys.habit_not_done.tr(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  SlidableAction(
                    onPressed: (context) => onHalfDone(habit),
                    icon: Icons.check_circle_outline_rounded,
                    backgroundColor: AppColors.orange500,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                    label: LocaleKeys.habit_fifty_done.tr(),
                  ),
                  SlidableAction(
                    onPressed: (context) => onDone(habit),
                    icon: Icons.check_circle_outline_rounded,
                    backgroundColor: AppColors.green500,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                    label: LocaleKeys.habit_hundred_done.tr(),
                  ),
                ],
              ),
              child: ChallengeHabitTile(
                habit: habit,
              ),
            ),
          ),
        ),
        if (completedTodayHabits.isNotEmpty)
          TitledDivider(
            title: LocaleKeys.completed.tr(),
          ),
        if (completedTodayHabits.isNotEmpty) AppSpacing.vertical16,
        ...completedTodayHabits.map(
          (habit) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ChallengeHabitTile(
              canShowTrailing: true,
              habit: habit,
            ),
          ),
        ),
      ],
    );
  }
}
