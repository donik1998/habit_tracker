import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool pushNotifications = true;

  void setPushNotifications(bool value) {
    pushNotifications = value;
    notifyListeners();
  }
}
