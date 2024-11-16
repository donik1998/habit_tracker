import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';

class GoalsTabProvider extends ChangeNotifier {
  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();
  late final Stream<List<GoalGroupModel>> goalsStream = localDatabaseRepository.watchGoalGroups();

  Future<void> refreshGoals() async {
    notifyListeners();
  }
}
