import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class ChallengeInfoProvider extends ChangeNotifier {
  ChallengeModel challenge;
  bool loading = false;
  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();

  ChallengeInfoProvider(this.challenge);

  Future<void> reloadChallenge() async {
    loading = true;
    notifyListeners();
    try {
      challenge = await localDatabaseRepository.fetchChallengeById(challenge.id);
    } catch (e) {
      print(e);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteChallenge() async {
    loading = true;
    notifyListeners();
    try {
      await localDatabaseRepository.deleteChallenge(challenge.id);
      return true;
    } catch (e) {
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
