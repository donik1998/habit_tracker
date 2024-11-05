import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class ChallengeHabitTile extends StatelessWidget {
  final HabitModel habit;

  const ChallengeHabitTile({
    Key? key,
    required this.habit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}
