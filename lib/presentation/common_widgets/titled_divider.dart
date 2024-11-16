import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class TitledDivider extends StatelessWidget {
  final String title;

  const TitledDivider({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Stack(
      children: [
        const Divider(
          color: AppColors.platinum100,
          height: 32,
          thickness: 2,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(color: AppColors.platinum100, width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              title,
              style: textTheme?.mediumTextTheme.typography2.copyWith(color: AppColors.platinum100),
            ),
          ),
        ),
      ],
    );
  }
}
