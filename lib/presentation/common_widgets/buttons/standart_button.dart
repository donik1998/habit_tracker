import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/common_widgets/loader.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class StandardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final double? customWidth;
  final double? customHeight;
  final Color backgroundColor;
  final Color textColor;
  final bool disabled;

  const StandardButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.loading = false,
    this.customWidth,
    this.customHeight,
    this.backgroundColor = AppColors.purple500,
    this.textColor = Colors.white,
    this.disabled = false,
  }) : super(key: key);

  factory StandardButton.light({
    required VoidCallback onPressed,
    required String text,
    bool loading = false,
    double? customWidth,
    double? customHeight,
  }) =>
      StandardButton(
        onPressed: onPressed,
        text: text,
        loading: loading,
        customWidth: customWidth,
        customHeight: customHeight,
        backgroundColor: AppColors.purple100,
        textColor: AppColors.purple500,
      );

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.customTextTheme?.boldTextTheme;

    return Material(
      color: disabled ? AppColors.platinum100 : backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: loading || disabled ? null : onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          height: customHeight ?? (MediaQuery.of(context).size.width * 0.91 * 0.1685),
          width: customWidth ?? double.infinity,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: loading
                  ? const Loader()
                  : Text(
                      text,
                      style: boldTextTheme?.typography3.copyWith(color: disabled ? AppColors.disabledText : textColor),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
