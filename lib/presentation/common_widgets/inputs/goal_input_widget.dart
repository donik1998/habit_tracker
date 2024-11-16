import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/transparent_input_field.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class GoalInputWidget extends StatelessWidget {
  final bool selected;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  final ValueChanged<bool>? onChangedDoneStatus;
  final String label;
  final bool autofocus;

  const GoalInputWidget({
    super.key,
    required this.selected,
    required this.controller,
    required this.onEditingComplete,
    required this.label,
    this.onChangedDoneStatus,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(
            side: BorderSide(
              color: AppColors.disabledText,
            ),
          ),
          value: selected,
          onChanged: (value) => onChangedDoneStatus?.call(value ?? false),
        ),
        AppSpacing.horizontal8,
        Expanded(
          child: TransparentInputField(
            controller: controller,
            onEditingComplete: onEditingComplete,
            label: label,
            autofocus: autofocus,
            selected: selected,
          ),
        ),
      ],
    );
  }
}
