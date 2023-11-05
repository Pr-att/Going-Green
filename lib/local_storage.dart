import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static Future<void> setString(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<void> setInt(String key, int value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  static Future<void> setStringList(String key, List<String> value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  static Future getString(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<double?> getDouble(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static Future<List<String>?> getStringList(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static Future<void> remove(String key) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
  //
  static Future<void> clear() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
  //
  static Future<void> reload() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.reload();
  }
}
