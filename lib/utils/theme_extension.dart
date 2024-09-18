import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/text_themes.dart';

extension ThemeExtension on BuildContext {
  CustomTextTheme? get customTextTheme => Theme.of(this).extension<CustomTextTheme>();
}
