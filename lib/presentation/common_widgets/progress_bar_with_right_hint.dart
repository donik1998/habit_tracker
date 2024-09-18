import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class ProgressBarWithRightHint extends StatelessWidget {
  final int progress;
  final int maxProgress;

  const ProgressBarWithRightHint({
    Key? key,
    required this.progress,
    required this.maxProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return SizedBox(
      height: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 6,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.someWhite,
              ),
              child: FractionallySizedBox(
                widthFactor: max(0, progress / maxProgress),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: const ColoredBox(
                    color: AppColors.blue900,
                  ),
                ),
              ),
            ),
          ),
          AppSpacing.horizontal6,
          Text(
            '$progress/$maxProgress',
            style: textTheme?.boldTextTheme.typography1.copyWith(
              color: AppColors.blue900,
            ),
          ),
        ],
      ),
    );
  }
}
