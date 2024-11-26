import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class GoalGroupWidget extends StatelessWidget {
  final GoalGroupModel goalGroup;
  final VoidCallback? onTap;
  final VoidCallback? onDone;

  const GoalGroupWidget({
    super.key,
    required this.goalGroup,
    this.onTap,
    this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Material(
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () {
          onTap?.call();
          Navigator.pushNamed(
            context,
            AppRoutes.goalPage,
            arguments: goalGroup,
          ).whenComplete(() => onDone?.call());
        },
        child: Ink(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: ColoredBox(
                    color: AppColors.purple500,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: goalGroup.iconPath.contains('.svg')
                          ? SvgPicture.asset(
                              goalGroup.iconPath,
                              width: 24,
                              height: 24,
                              color: Colors.white,
                            )
                          : Image.asset(
                              goalGroup.iconPath,
                              width: 24,
                              height: 24,
                              errorBuilder: (context, error, stackTrace) => SvgPicture.asset(
                                Assets.svg.informationOutlined.path,
                                color: AppColors.disabledText,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              AppSpacing.horizontal16,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goalGroup.name,
                      style: textTheme?.boldTextTheme.typography3,
                    ),
                    AppSpacing.vertical2,
                    Text(
                      '${goalGroup.goals.length}',
                      style: textTheme?.regularTextTheme.typography2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
