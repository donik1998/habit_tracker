import 'package:flutter/widgets.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';
import 'package:habit_tracker/utils/debouncer.dart';

class GoalsGroupPageProvider extends ChangeNotifier {
  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();

  GoalsGroupPageProvider({required this.groupModel});
  final debouncer = Debouncer(delayMilliseconds: 500);
  bool inEditMode = false;
  GoalGroupModel groupModel;
  late final Map<int, TextEditingController> goalTextControllers =
      Map<int, TextEditingController>.fromEntries(
    groupModel.goals.map(
      (e) => MapEntry(e.id, TextEditingController(text: e.description)),
    ),
  );
  final TextEditingController newGoalTextController = TextEditingController();

  Future<void> saveNewGoal() async {
    GoalModel newGoal = GoalModel(
      id: -1,
      description: newGoalTextController.text,
      groupId: groupModel.id,
      isCompleted: false,
      cacheTimestamp: DateTime.now(),
    );
    if (newGoal.description.isEmpty) return;
    await localDatabaseRepository.createGoal(model: newGoal);

    newGoal =
        (await localDatabaseRepository.fetchGoal(description: newGoal.description)) ?? newGoal;
    groupModel.goals.add(newGoal);
    goalTextControllers[newGoal.id] = TextEditingController(text: newGoal.description);
    newGoalTextController.clear();
    notifyListeners();
  }

  Future<void> editGoal({
    required int goalId,
    String? newDescription,
    bool? done,
  }) async {
    if (newDescription == null && done == null) return;

    final goalIndex = groupModel.goals.indexWhere((element) => element.id == goalId);
    GoalModel goal = groupModel.goals.elementAt(goalIndex);
    if (goalIndex.isNegative) return;

    if (newDescription != null) goal = goal.copyWith(description: newDescription);
    if (done != null) goal = goal.copyWith(isCompleted: done);
    groupModel.goals[goalIndex] = goal;
    groupModel.copyWith(goals: groupModel.goals);
    notifyListeners();
    await localDatabaseRepository.updateGoal(goal);
  }

  void toggleEditingMode() {
    inEditMode = !inEditMode;
    notifyListeners();
  }
}
