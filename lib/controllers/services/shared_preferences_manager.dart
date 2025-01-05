import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final instance = SharedPreferencesManager._();

  SharedPreferencesManager._();

  factory SharedPreferencesManager() {
    return instance;
  }

  static late SharedPreferences _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Read value from SharedPreferences
  static dynamic getValue(String key) async {
    return _preferences.get(key);
  }

  // Write value to SharedPreferences
  static Future<void> setValue(String key, dynamic value) async {
    if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  // Remove value from SharedPreferences
  static Future<void> removeValue(String key) async {
    await _preferences.remove(key);
  }

  // Clear all data in SharedPreferences
  static Future<void> clearAll() async {
    await _preferences.clear();
  }
}
