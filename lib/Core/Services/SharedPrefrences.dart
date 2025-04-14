import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late final SharedPreferences _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setBool(String key, dynamic value) async {
    await _preferences.setBool(key, value);
  }

  static Future getValue(String key) async {
    return _preferences.get(key);
  }

  static Future setString(String key, dynamic value) async {
    await _preferences.setString(key, value);
  }
  static Future setMap(String key , String value) async {
    await _preferences.setString(key, value);
  }
  static Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
