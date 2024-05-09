import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task_energise_pro/data/repo/shared_preferences/shared_preference.dart';

class SharedPreferenceImpl implements SharedPreference{

  static const String notificationToken = "notificationToken";
  static const String webToken = "webToken";

  final SharedPreferences prefs;
  SharedPreferenceImpl(this.prefs);
  
  @override
  setStringPreferenceValue(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  setIntPreferenceValue(String key, int value) async {
    await prefs.setInt(key, value);
  }

  @override
  Future<bool> setBoolPreferenceValue(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  @override
  setDoublePreferenceValue(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  @override
  Future<String> getStringPreferenceValue(String key) async {
    return prefs.getString(key) ?? "";
  }

  @override
  Future<int> getIntPreferenceValue(String key) async {
    return prefs.getInt(key) ?? 0;
  }

  @override
  Future<bool> getBoolPreferenceValue(String key) async {
    return prefs.getBool(key) ?? false;
  }

  @override
  Future<double?> getDoublePreferenceValue(String key) async {
    return prefs.getDouble(key);
  }

  @override
  Future removePreferenceValue(String key) async {
    await prefs.remove(key);
  }
}

