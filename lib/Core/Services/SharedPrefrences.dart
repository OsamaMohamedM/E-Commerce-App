import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late final SharedPreferences _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void setBool(String key, dynamic value) {
    _preferences.setBool(key, value);
  }

  static getValue(String key) {
    return _preferences.get(key);
  }
}
