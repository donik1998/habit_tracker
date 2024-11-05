import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/common_widgets/loader.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class StandardOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final double? customWidth;
  final double? customHeight;
  final bool disabled;
  final Color? borderColor;
  final Color? textColor;

  const StandardOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.loading,
    this.disabled = false,
    this.customWidth,
    this.customHeight,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.customTextTheme?.boldTextTheme;

    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: borderColor ?? AppColors.borderStandard, width: 1),
      ),
      child: InkWell(
        onTap: loading ? null : onPressed,
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
                      style: boldTextTheme?.typography3.copyWith(color: textColor ?? AppColors.platinum900),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
