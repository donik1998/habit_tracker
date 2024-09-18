import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';

class CreateChallengePageProvider extends ChangeNotifier {
  final localDatabaseRepository = locator<LocalDatabaseRepository>();

  CreateChallengePageProvider() {
    startDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    durationController.text = '21';
    titleController.addListener(_validateFields);
  }

  String? selectedIconPath;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();

  bool loading = false;

  void selectIcon(String iconPath) {
    selectedIconPath = iconPath;
    notifyListeners();
  }

  void _validateFields() {
    notifyListeners();
  }

  void setStartDate(DateTime date) {
    startDateController.text = DateFormat('dd/MM/yyyy').format(date);
    notifyListeners();
  }

  bool get isFormValid =>
      titleController.text.isNotEmpty && durationController.text.isNotEmpty && startDateController.text.isNotEmpty;

  Future<bool> saveChallenge() async {
    print(isFormValid);
    if (!isFormValid) return false;
    loading = true;
    notifyListeners();
    try {
      localDatabaseRepository.createChallenge(
        challengeName: titleController.text,
        iconPath: selectedIconPath!,
        durationInDays: int.parse(durationController.text),
        startDate: DateFormat('dd/MM/yyyy').parse(startDateController.text),
        endDate: DateFormat('dd/MM/yyyy')
            .parse(startDateController.text)
            .add(Duration(days: int.parse(durationController.text))),
      );
      return true;
    } catch (e) {
      print(e);
    } finally {
      loading = false;
      notifyListeners();
    }
    return false;
  }
}
