import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<DropdownMenuItem<int>> items;
  final ValueChanged<DropdownMenuItem<int>> onItemSelected;
  final String title;

  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.title,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.borderStandard,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: DropdownButton<int>(
          value: selectedItem,
          isExpanded: true,
          selectedItemBuilder: (context) {
            return widget.items.map((item) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: textTheme?.regularTextTheme.typography1.copyWith(
                      color: AppColors.textFieldText,
                    ),
                  ),
                  item.child,
                ],
              );
            }).toList();
          },
          padding: EdgeInsets.zero,
          underline: const SizedBox(),
          icon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.textFieldText,
          ),
          dropdownColor: Colors.white,
          items: widget.items,
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });
            widget.onItemSelected(DropdownMenuItem(
              value: selectedItem,
              child: Text(selectedItem!.toString()),
            ));
          },
        ),
      ),
    );
  }
}

class CustomDropDownItem {
  final String mask;
  final String value;

  const CustomDropDownItem({
    required this.mask,
    required this.value,
  });
}
