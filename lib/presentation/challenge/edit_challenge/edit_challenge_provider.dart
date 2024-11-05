import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';

class EditChallengeProvider extends ChangeNotifier {
  ChallengeModel challenge;

  LocalDatabaseRepository get localDatabaseRepository => locator<LocalDatabaseRepository>();

  EditChallengeProvider(this.challenge) {
    titleController.text = challenge.title;
    startDateController.text = DateFormat('dd/MM/yyyy').format(challenge.startDate);
    durationController.text = challenge.duration.toString();
    selectedIconPath = challenge.iconPath;
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

  Future<bool> editChallenge() async {
    if (!isFormValid) return false;
    loading = true;
    notifyListeners();
    try {
      challenge = challenge.copyWith(
        title: titleController.text,
        iconPath: selectedIconPath!,
        duration: int.parse(durationController.text),
        startDate: DateFormat('dd/MM/yyyy').parse(startDateController.text),
      );
      notifyListeners();
      await localDatabaseRepository.editChallenge(challenge);
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
