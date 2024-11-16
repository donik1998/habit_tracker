import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class ChallengeDetailsProvider extends ChangeNotifier {
  final int challengeId;
  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();
  late ChallengeModel challenge;
  ValueNotifier<DateTimeRange> selectedWeekNotifier = ValueNotifier(
    DateTimeRange(start: DateTime.now(), end: DateTime.now()),
  );
  bool loading = true;
  String selectedHabitsDisplayingMode = ChallengeHabitsDisplayingMode.daily;

  ChallengeDetailsProvider(this.challengeId) {
    localDatabaseRepository.fetchChallengeById(challengeId).then((value) {
      challenge = value;
      loading = false;
      notifyListeners();
    });
  }

  void switchHabitsDisplayingMode(String? mode) {
    if (mode == null) return;
    selectedHabitsDisplayingMode = mode;
    notifyListeners();
  }

  Future<void> markDailyProgress(int habitId, double progress) async {}

  void selectWeek(DateTimeRange week) {
    selectedWeekNotifier.value = week;
  }

  void markWeeklyProgress({
    required int habitId,
    required int habitProgressId,
    required double progress,
  }) {
    localDatabaseRepository
        .editHabitProgress(
      habitId: habitId,
      progressId: habitProgressId,
      progress: progress,
    )
        .then((value) {
      refreshChallenge();
    });
  }

  Future<void> refreshChallenge() async {
    loading = true;
    notifyListeners();
    try {
      challenge = await localDatabaseRepository.fetchChallengeById(challengeId);
    } catch (e) {
      print(e);
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}

class ChallengeHabitsDisplayingMode {
  ChallengeHabitsDisplayingMode._();

  static const daily = 'daily';

  static const weekly = 'weekly';

  static const overall = 'overall';
}
