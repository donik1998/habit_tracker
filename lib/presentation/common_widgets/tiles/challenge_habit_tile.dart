import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class ChallengeHabitTile extends StatelessWidget {
  final HabitModel habit;
  final VoidCallback? onTap;
  final bool canShowTrailing;

  const ChallengeHabitTile({
    Key? key,
    required this.habit,
    this.onTap,
    this.canShowTrailing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(20),
      color: habit.uiColor.withOpacity(0.25),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width * 0.22,
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: habit.uiColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    habit.iconPath,
                    color: Colors.white,
                  ),
                ),
              ),
              AppSpacing.horizontal16,
              Expanded(
                child: Text(
                  habit.title,
                  style: context.customTextTheme?.mediumTextTheme.typography3,
                ),
              ),
              if (habit.todayCompletenessStatus != HabitProgressStatus.initial && canShowTrailing)
                ClipOval(
                  child: ColoredBox(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        habit.todayCompletenessStatus == HabitProgressStatus.notStarted
                            ? Assets.svg.closeFilled.path
                            : habit.todayCompletenessStatus == HabitProgressStatus.halfDone
                                ? Assets.svg.checkCircleOrange.path
                                : habit.todayCompletenessStatus == HabitProgressStatus.completed
                                    ? Assets.svg.checkCircleGreen.path
                                    : Assets.svg.informationOutlined.path,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
