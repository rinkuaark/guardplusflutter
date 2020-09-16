import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences preferences;

  static Future<bool> savePref(String key, String value) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  static Future<String> readPref(String key) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> removePref(String key) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }

  static Future<bool> clearPref() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
