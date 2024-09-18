import 'package:flutter/material.dart';

class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  final TextStyleCollection lightTextTheme = LightTextTheme();
  final TextStyleCollection regularTextTheme = RegularTextTheme();
  final TextStyleCollection mediumTextTheme = MediumTextTheme();
  final TextStyleCollection boldTextTheme = BoldTextTheme();

  @override
  ThemeExtension<CustomTextTheme> copyWith() {
    return CustomTextTheme();
  }

  @override
  ThemeExtension<CustomTextTheme> lerp(ThemeExtension<CustomTextTheme>? other, double t) {
    if (other is! CustomTextTheme) {
      return this;
    }
    return CustomTextTheme();
  }
}

abstract class TextStyleCollection {
  final TextStyle typography1;
  final TextStyle typography2;
  final TextStyle typography3;
  final TextStyle typography4;
  final TextStyle typography5;
  final TextStyle typography6;
  final TextStyle typography7;
  final TextStyle typography8;
  final TextStyle typography9;

  TextStyleCollection({
    required this.typography1,
    required this.typography2,
    required this.typography3,
    required this.typography4,
    required this.typography5,
    required this.typography6,
    required this.typography7,
    required this.typography8,
    required this.typography9,
  });
}

class LightTextTheme implements TextStyleCollection {
  @override
  TextStyle typography1 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 12,
  );

  @override
  TextStyle typography2 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 14,
  );

  @override
  TextStyle typography3 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 16,
  );

  @override
  TextStyle typography4 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 18,
  );

  @override
  TextStyle typography5 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 20,
  );

  @override
  TextStyle typography6 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 24,
  );

  @override
  TextStyle typography7 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 28,
  );

  @override
  TextStyle typography8 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 35,
  );

  @override
  TextStyle typography9 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 60,
  );
}

class RegularTextTheme implements TextStyleCollection {
  @override
  TextStyle typography1 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 12,
  );

  @override
  TextStyle typography2 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 14,
  );

  @override
  TextStyle typography3 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16,
  );

  @override
  TextStyle typography4 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 18,
  );

  @override
  TextStyle typography5 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 20,
  );

  @override
  TextStyle typography6 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 24,
  );

  @override
  TextStyle typography7 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 28,
  );

  @override
  TextStyle typography8 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 35,
  );

  @override
  TextStyle typography9 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 60,
  );
}

class MediumTextTheme implements TextStyleCollection {
  @override
  TextStyle typography1 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 12,
  );

  @override
  TextStyle typography2 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 14,
  );

  @override
  TextStyle typography3 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16,
  );

  @override
  TextStyle typography4 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 18,
  );

  @override
  TextStyle typography5 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 20,
  );

  @override
  TextStyle typography6 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 24,
  );

  @override
  TextStyle typography7 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 28,
  );

  @override
  TextStyle typography8 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 35,
  );

  @override
  TextStyle typography9 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 60,
  );
}

class BoldTextTheme implements TextStyleCollection {
  @override
  TextStyle typography1 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 12,
  );

  @override
  TextStyle typography2 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 14,
  );

  @override
  TextStyle typography3 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 16,
  );

  @override
  TextStyle typography4 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 18,
  );

  @override
  TextStyle typography5 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 20,
  );

  @override
  TextStyle typography6 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 24,
  );

  @override
  TextStyle typography7 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 28,
  );

  @override
  TextStyle typography8 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 35,
  );

  @override
  TextStyle typography9 = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 60,
  );
}
