import 'package:flutter/cupertino.dart';

class CreateHabitProvider extends ChangeNotifier {
  final int challengeId;

  final TextEditingController habitNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String selectedIconPath = '';

  CreateHabitProvider(this.challengeId);

  void selectIcon(String iconPath) {
    selectedIconPath = iconPath;
    notifyListeners();
  }

  @override
  void dispose() {
    habitNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
