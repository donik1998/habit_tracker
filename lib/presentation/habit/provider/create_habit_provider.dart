import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class CreateHabitProvider extends ChangeNotifier {
  LocalDatabaseRepository get _localDatabaseRepository => LocalDatabaseRepository();

  int? challengeId;

  final TextEditingController habitNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedIconPath;
  Color? selectedColor;
  bool addToChallenge = false;
  List<ChallengeModel> challenges = [];

  CreateHabitProvider(this.challengeId) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (challengeId != null) return;

        _localDatabaseRepository.fetchAllChallenges().then((value) {
          challenges = List<ChallengeModel>.from(value);
          notifyListeners();
        });
      },
    );
  }

  void setChallengeId(int? id) {
    if (id == null) return;
    challengeId = id;
    notifyListeners();
  }

  void selectIcon(String iconPath) {
    selectedIconPath = iconPath;
    notifyListeners();
  }

  void selectColor(Color color) {
    selectedColor = color;
    notifyListeners();
  }

  void setAddToChallenge(bool value) {
    addToChallenge = value;
    notifyListeners();
  }

  Future<bool> createHabit() async {
    if (selectedColor == null || selectedIconPath == null) return false;
    try {
      final habit = HabitModel(
        challengeId: challengeId,
        title: habitNameController.text,
        description: descriptionController.text,
        iconPath: selectedIconPath ?? '',
        color: selectedColor?.value.toRadixString(16) ?? '',
        cacheTimestamp: DateTime.now(),
        isCompleted: false,
      );

      await _localDatabaseRepository.createHabit(habit);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    habitNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
