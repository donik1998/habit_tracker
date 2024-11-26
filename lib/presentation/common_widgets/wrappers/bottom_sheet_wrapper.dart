import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';

class BottomSheetWrapper extends StatelessWidget {
  final Widget child;
  final Size? childSize;

  const BottomSheetWrapper({
    Key? key,
    required this.child,
    this.childSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.vertical8,
            Container(
              width: 32,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            AppSpacing.vertical8,
            SizedBox.fromSize(size: childSize, child: child),
          ],
        ),
      ),
    );
  }
}
