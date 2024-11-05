import 'package:flutter/widgets.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';

class CreateGoalGroupProvider extends ChangeNotifier {
  CreateGoalGroupProvider() {
    titleController.addListener(_validateField);
  }

  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();
  String? selectedIconPath;
  bool get isFormValid => titleController.text.isNotEmpty && selectedIconPath != null;
  bool loading = false;

  void selectIcon(String iconPath) {
    selectedIconPath = iconPath;
    notifyListeners();
  }

  void _validateField() {
    notifyListeners();
  }

  final TextEditingController titleController = TextEditingController();

  Future<bool> createGoalsGroup() async {
    if (!isFormValid) return false;
    try {
      loading = true;
      notifyListeners();
      await localDatabaseRepository.createGoalGroup(title: titleController.text, iconPath: selectedIconPath!);
      loading = false;
      notifyListeners();
      return true;
    } catch (e) {
      loading = false;
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    titleController.removeListener(_validateField);
    titleController.dispose();
    super.dispose();
  }
}
