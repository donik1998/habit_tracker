import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/common_widgets/loader.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class StandardTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final double? customWidth;

  const StandardTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.loading = false,
    this.customWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.customTextTheme?.boldTextTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: loading ? null : onPressed,
        child: Ink(
          height: (customWidth ?? MediaQuery.of(context).size.width) * 0.91 * 0.1685,
          width: customWidth ?? double.infinity,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: loading
                  ? const Loader()
                  : Text(
                      text,
                      style: boldTextTheme?.typography3.copyWith(color: AppColors.purple500),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
