import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class TransparentInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String?>? onChanged;
  final String label;
  final bool autofocus;
  final bool selected;
  final bool withLabel;

  const TransparentInputField({
    super.key,
    required this.controller,
    this.onEditingComplete,
    this.onChanged,
    required this.label,
    required this.autofocus,
    required this.selected,
    this.withLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return TextField(
      controller: controller,
      onEditingComplete: onEditingComplete,
      minLines: 1,
      maxLines: 10,
      autofocus: autofocus,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => onEditingComplete?.call(),
      onChanged: onChanged,
      style: textTheme?.mediumTextTheme.typography3.copyWith(
        decoration: selected ? TextDecoration.lineThrough : null,
        decorationColor: AppColors.purple500,
        color: selected
            ? AppColors.disabledText
            : withLabel
                ? AppColors.textFieldInput
                : AppColors.textFieldText,
      ),
      decoration: InputDecoration(
        hintText: withLabel ? null : label,
        hintStyle: const TextStyle(
          color: AppColors.disabledText,
        ),
        labelStyle: textTheme?.regularTextTheme.typography1.copyWith(
          color: withLabel ? AppColors.platinum500 : AppColors.textFieldText,
        ),
        labelText: withLabel ? label : null,
        border: InputBorder.none,
      ),
    );
  }
}
