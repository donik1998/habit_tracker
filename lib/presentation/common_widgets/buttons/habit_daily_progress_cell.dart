import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/extensions.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class HabitDailyProgressCell extends StatelessWidget {
  final HabitProgressModel item;
  final VoidCallback? onTap;
  final Size? size;
  final Color? fillColor;

  const HabitDailyProgressCell({
    super.key,
    required this.item,
    this.onTap,
    this.size,
    this.fillColor,
  });

  factory HabitDailyProgressCell.filled({
    required HabitProgressModel item,
    VoidCallback? onTap,
    Size? size,
    required Color fillColor,
  }) =>
      HabitDailyProgressCell(
        item: item,
        onTap: onTap,
        size: size,
        fillColor: fillColor,
      );

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Material(
      color: item.progressStatus == HabitProgressStatus.completed
          ? AppColors.green500
          : item.progressStatus == HabitProgressStatus.halfDone
              ? AppColors.orange500
              : Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
          color: item.date.isSameDay(DateTime.now())
              ? AppColors.purple500
              : item.progressStatus == HabitProgressStatus.completed
                  ? AppColors.green500
                  : item.progressStatus == HabitProgressStatus.halfDone
                      ? AppColors.orange500
                      : AppColors.platinum300,
          width: 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: size?.width ?? 24,
          height: size?.height ?? 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              item.dayCount.toString(),
              style: textTheme?.mediumTextTheme.typography1.copyWith(
                color: item.progressStatus == HabitProgressStatus.notStarted ||
                        item.progressStatus == HabitProgressStatus.initial
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
