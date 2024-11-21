import 'package:flutter/foundation.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class FinishedChallengesProvider extends ChangeNotifier {
  LocalDatabaseRepository get _localDatabaseRepository => locator<LocalDatabaseRepository>();

  List<ChallengeModel> challenges = [];

  FinishedChallengesProvider() {
    _loadFinishedChallenges();
  }

  Future<void> _loadFinishedChallenges() async {
    final finishedChallenges = await _localDatabaseRepository.fetchFinishedChallenges();
    challenges = finishedChallenges;
    notifyListeners();
  }
}
