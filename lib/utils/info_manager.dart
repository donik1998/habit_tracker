import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class InfoManager {
  InfoManager._();

  static void showSuccessSnackBar(BuildContext context, String message) {
    final textTheme = context.customTextTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SvgPicture.asset(
              Assets.svg.informationOutlined.path,
              color: AppColors.success,
              width: 24,
              height: 24,
            ),
            AppSpacing.horizontal8,
            Text(
              message,
              style: textTheme?.mediumTextTheme.typography2.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.platinum100,
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    final textTheme = context.customTextTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SvgPicture.asset(
              Assets.svg.informationOutlined.path,
              color: AppColors.error,
              width: 24,
              height: 24,
            ),
            AppSpacing.horizontal8,
            Text(
              message,
              style: textTheme?.mediumTextTheme.typography2.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.purple500,
      ),
    );
  }
}
