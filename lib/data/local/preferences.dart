import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class LocalPreferences {
  late final SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String?> get appLanguage => _getValue<String>(AppLocalPreferences.appLanguage);

  Future<T?> _getValue<T>(String name) async {
    if (T == String) {
      return _preferences.getString(name) as T?;
    } else if (T == int) {
      return _preferences.getInt(name) as T?;
    } else if (T == double) {
      return _preferences.getDouble(name) as T?;
    } else if (T == bool) {
      return _preferences.getBool(name) as T?;
    } else if (T == List<String>) {
      return _preferences.getStringList(name) as T?;
    } else {
      throw Exception('Type not supported');
    }
  }

  Future<void> savePreference(String name, dynamic value) async {
    if (value is String) {
      await _preferences.setString(name, value);
    } else if (value is int) {
      await _preferences.setInt(name, value);
    } else if (value is double) {
      await _preferences.setDouble(name, value);
    } else if (value is bool) {
      await _preferences.setBool(name, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(name, value);
    } else {
      throw Exception('Type not supported');
    }
  }
}

class AppLocalPreferences {
  AppLocalPreferences._();

  static const String appLanguage = 'appLanguage';
}
