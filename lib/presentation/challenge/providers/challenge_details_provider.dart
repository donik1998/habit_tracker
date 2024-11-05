import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class ChallengeDetailsProvider extends ChangeNotifier {
  final int challengeId;
  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();
  late ChallengeModel challenge;
  bool loading = true;

  ChallengeDetailsProvider(this.challengeId) {
    localDatabaseRepository.fetchChallengeById(challengeId).then((value) {
      challenge = value;
      loading = false;
      notifyListeners();
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
