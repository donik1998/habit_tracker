import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/utils/debouncer.dart';

class HabitDetailsProvider extends ChangeNotifier {
  LocalDatabaseRepository get _localDatabaseRepository => locator<LocalDatabaseRepository>();

  HabitModel habit;

  final debouncer = Debouncer(delayMilliseconds: 500);

  HabitDetailsProvider({required this.habit}) {
    if (habit.progress.isEmpty) updateHabit();
  }

  Future<bool> editHabitProgress({required int progressId, required double progress}) async {
    try {
      await _localDatabaseRepository.editHabitProgress(
        habitId: habit.id,
        progressId: progressId,
        progress: progress,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updateHabit() async {
    habit = await _localDatabaseRepository.fetchHabitById(habit.id);
    final progress = await _localDatabaseRepository.fetchHabitProgress(habit.id);
    habit = habit.copyWith(progress: progress);
    notifyListeners();
  }
}
