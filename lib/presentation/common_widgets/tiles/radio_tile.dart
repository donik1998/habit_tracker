import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class RadioTile extends StatelessWidget {
  final String mask;
  final String value;
  final ValueChanged<bool> onChanged;
  final bool selected;
  final bool transparent;

  const RadioTile({
    Key? key,
    required this.mask,
    required this.value,
    required this.onChanged,
    this.selected = false,
    this.transparent = false,
  }) : super(key: key);

  const RadioTile.transparent({
    Key? key,
    required this.mask,
    required this.value,
    required this.onChanged,
    this.selected = false,
  })  : transparent = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTextTheme = context.customTextTheme;

    return Material(
      color: transparent
          ? Colors.transparent
          : selected
              ? AppColors.purple50
              : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: transparent
              ? Colors.transparent
              : selected
                  ? AppColors.purple50
                  : AppColors.platinum100,
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => onChanged(!selected),
        child: Ink(
          height: MediaQuery.of(context).size.width * 0.91 * 0.175,
          width: double.infinity,
          child: Row(
            children: [
              AppSpacing.horizontal16,
              SvgPicture.asset(
                selected
                    ? Assets.svg.radioButtonSelected.path
                    : Assets.svg.radioButtonUnselected.path,
              ),
              AppSpacing.horizontal10,
              Flexible(
                child: Text(
                  mask,
                  style: customTextTheme?.regularTextTheme.typography3,
                ),
              ),
              AppSpacing.horizontal16,
            ],
          ),
        ),
      ),
    );
  }
}
