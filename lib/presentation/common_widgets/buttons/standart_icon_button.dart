import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/common_widgets/loader.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';

class StandardIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final SvgGenImage icon;
  final bool loading;
  final double? customWidth;
  final double? customHeight;
  final Color backgroundColor;
  final Color iconColor;
  final bool disabled;

  const StandardIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor = AppColors.purple500,
    this.backgroundColor = AppColors.purple100,
    this.loading = false,
    this.disabled = false,
    this.customWidth,
    this.customHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: disabled ? AppColors.platinum100 : backgroundColor,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: loading ? null : onPressed,
        child: Ink(
          height: customHeight ?? 48,
          width: customWidth ?? 48,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: loading
                  ? const Loader()
                  : SvgPicture.asset(
                      icon.path,
                      color: iconColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
