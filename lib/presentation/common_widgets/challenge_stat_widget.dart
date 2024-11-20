import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class ChallengeStatWidget extends StatelessWidget {
  final String title;
  final String value;

  const ChallengeStatWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.green50,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: value,
              style: textTheme?.boldTextTheme.typography8.copyWith(color: AppColors.green900),
            ),
            TextSpan(
              text: '\n$title',
              style: textTheme?.regularTextTheme.typography2.copyWith(
                color: AppColors.platinum500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
