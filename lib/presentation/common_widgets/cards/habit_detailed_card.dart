import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/habit_daily_progress_cell.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class HabitDetailedCard extends StatelessWidget {
  final HabitModel habit;
  final bool showDates;
  final void Function(int progressId, double progress)? onProgressChanged;
  final Widget? content;

  const HabitDetailedCard({
    super.key,
    required this.habit,
    this.showDates = true,
    this.onProgressChanged,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: habit.uiColor.withOpacity(0.1),
        border: Border.all(
          width: 1,
          color: habit.uiColor.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: habit.uiColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      habit.iconPath,
                      color: Colors.white,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
                AppSpacing.horizontal8,
                Text(
                  habit.title,
                  style: textTheme?.boldTextTheme.typography3,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: content ??
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: habit.progress
                          .map(
                            (item) => HabitDailyProgressCell(
                              item: item,
                              onTap: item.date.isAfter(DateTime.now())
                                  ? null
                                  : () => onProgressChanged?.call(
                                        item.id,
                                        item.progressStatus == HabitProgressStatus.notStarted
                                            ? HABIT_PROGRESS_HALF_DONE
                                            : item.progressStatus == HabitProgressStatus.halfDone
                                                ? HABIT_PROGRESS_COMPLETED
                                                : HABIT_PROGRESS_NOT_DONE,
                                      ),
                            ),
                          )
                          .toList(),
                    ),
              ),
            ),
          ),
          if (showDates)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LocaleKeys.start_date.tr(),
                          style: textTheme?.regularTextTheme.typography1,
                        ),
                        TextSpan(
                          text: habit.startDate != null
                              ? ': ${DateFormat('dd MMMM yyyy', Localizations.localeOf(context).languageCode).format(habit.startDate!)}'
                              : ': ${LocaleKeys.none.tr()}',
                          style: textTheme?.mediumTextTheme.typography1.copyWith(
                            color: habit.uiColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.vertical4,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LocaleKeys.end_date.tr(),
                          style: textTheme?.regularTextTheme.typography1,
                        ),
                        TextSpan(
                          text: habit.endDate != null
                              ? ': ${DateFormat('dd MMMM yyyy', Localizations.localeOf(context).languageCode).format(habit.endDate!)}'
                              : ': ${LocaleKeys.none.tr()}',
                          style: textTheme?.mediumTextTheme.typography1.copyWith(
                            color: habit.uiColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.vertical4,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LocaleKeys.completed_days.tr(),
                          style: textTheme?.regularTextTheme.typography1,
                        ),
                        TextSpan(
                          text: ': ${habit.completedDaysCount}/21',
                          style: textTheme?.mediumTextTheme.typography1.copyWith(
                            color: habit.uiColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
