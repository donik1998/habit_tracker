import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: AppColors.platinum100,
      color: AppColors.purple500,
    );
  }
}
