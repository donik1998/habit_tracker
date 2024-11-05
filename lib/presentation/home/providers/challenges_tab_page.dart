import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class ChallengeTabProvider extends ChangeNotifier {
  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();
  late final Stream<List<ChallengeModel>> challengesStream = localDatabaseRepository.watchChallenges();

  ChallengeTabProvider();
}
