import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class IconedListItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget? customText;

  const IconedListItem({
    Key? key,
    required this.icon,
    this.title = '',
    this.customText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Row(
      children: [
        icon,
        AppSpacing.horizontal4,
        Expanded(
          child: customText ??
              Text(
                title,
                style: textTheme?.regularTextTheme.typography1.copyWith(
                  color: AppColors.platinum900,
                ),
                textAlign: TextAlign.start,
              ),
        ),
      ],
    );
  }
}
