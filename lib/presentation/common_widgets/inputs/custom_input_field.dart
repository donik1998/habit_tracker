import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.label,
    this.controller,
    this.isActive = true,
    this.onChanged,
    this.errorMessage,
    this.inputFormatters,
    this.showErrorMessage = false,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    this.prefix,
    this.maxLength,
    this.readOnly = false,
  });

  final String label;
  final bool isActive;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorMessage;
  final List<TextInputFormatter>? inputFormatters;
  final bool showErrorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool readOnly;

  @override
  State createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  Color _borderColor = AppColors.borderStandard;
  final GlobalKey<FormFieldState> _globalKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      if (widget.isActive && !widget.readOnly) {
        widget.focusNode?.addListener(() {
          setState(() {
            _borderColor = (widget.focusNode?.hasFocus ?? false) ? AppColors.purple500 : AppColors.borderStandard;
          });
        });
      } else {
        _borderColor = AppColors.borderStandard;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: (widget.showErrorMessage && (widget.errorMessage != null) ? Colors.red : _borderColor),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: _globalKey,
                  obscureText: widget.obscureText,
                  textInputAction: widget.textInputAction,
                  onEditingComplete: widget.onEditingComplete,
                  inputFormatters: widget.inputFormatters,
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  readOnly: widget.readOnly,
                  maxLength: widget.maxLength,
                  style: textTheme?.regularTextTheme.typography3,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    prefix: widget.prefix,
                    counterText: "",
                    isDense: true,
                    suffixIcon: widget.errorMessage != null
                        ? SvgPicture.asset(Assets.svg.information.path, color: AppColors.error)
                        : widget.suffixIcon,
                    suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    labelText: widget.label,
                    labelStyle: textTheme?.regularTextTheme.typography1.copyWith(
                      color: widget.isActive ? AppColors.textFieldText : AppColors.borderStandard,
                    ),
                  ),
                ),
              ),
              if (widget.suffixIcon != null && (widget.focusNode?.hasFocus ?? false)) widget.suffixIcon!
            ],
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (child, animation) => SizeTransition(
            sizeFactor: animation,
            axis: Axis.vertical,
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: (widget.showErrorMessage && (widget.errorMessage?.isNotEmpty ?? false))
              ? Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    '* ${widget.errorMessage ?? ''}',
                    style: textTheme?.regularTextTheme.typography1.copyWith(color: AppColors.error),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
