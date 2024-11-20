import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/habit_daily_progress_cell.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

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
    final textTheme = context.customTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: selectedWeekProgressItems.map((item) {
        final isToday = item.date.isAtSameMomentAs(DateTime.now());
        final isEmpty = item.isEmpty;
        final weekdayStyle = !isToday
            ? textTheme?.regularTextTheme.typography1.copyWith(color: AppColors.platinum900)
            : textTheme?.boldTextTheme.typography1.copyWith(color: AppColors.purple500);
        final dateStyle = !isToday
            ? textTheme?.regularTextTheme.typography1.copyWith(color: AppColors.platinum500)
            : textTheme?.boldTextTheme.typography1.copyWith(color: AppColors.purple500);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // weekday short
              DateFormat(DateFormat.ABBR_WEEKDAY).format(item.date),
              style: weekdayStyle,
            ),
            AppSpacing.vertical8,
            Text(
              DateFormat('dd MMM').format(item.date),
              style: dateStyle,
            ),
            AppSpacing.vertical8,
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
