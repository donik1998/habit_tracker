import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class IconedRowWithAction extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;

  const IconedRowWithAction({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          icon,
          AppSpacing.horizontal16,
          Expanded(
            child: Text(
              title,
              style: textTheme?.mediumTextTheme.typography3.copyWith(color: AppColors.platinum900),
            ),
          ),
        ],
      ),
    );
  }
}
