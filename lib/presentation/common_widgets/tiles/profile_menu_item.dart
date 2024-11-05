import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class ProfileMenuItem extends StatelessWidget {
  final SvgGenImage icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      color: Colors.white,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SvgPicture.asset(
                icon.path,
                color: color ?? AppColors.purple500,
              ),
              AppSpacing.horizontal16,
              Expanded(
                child: Text(
                  title,
                  style: textTheme?.mediumTextTheme.typography3.copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
