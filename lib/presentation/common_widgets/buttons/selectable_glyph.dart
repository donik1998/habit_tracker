import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';

class SelectableGlyph extends StatelessWidget {
  final String iconPath;
  final bool selected;
  final double width;
  final VoidCallback onSelected;

  const SelectableGlyph({
    Key? key,
    required this.iconPath,
    required this.selected,
    required this.width,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: selected
              ? null
              : Border.all(
                  color: AppColors.borderStandard,
                  width: 1,
                ),
          color: selected ? AppColors.purple500 : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
            color: selected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
