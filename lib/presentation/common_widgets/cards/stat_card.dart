import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Ink(
      decoration: BoxDecoration(
        color: AppColors.platinum50,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: textTheme?.boldTextTheme.typography5.copyWith(
              color: AppColors.platinum900,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          Text(
            title,
            style: textTheme?.regularTextTheme.typography2.copyWith(
              color: AppColors.textFieldText,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
