//#################################################
// author: Sebastian Welscher
// year: 2022
//
// description: Class for managing Shared Preferences. For initializing,
//              bind SharedHelper.init() in main.
//
//#################################################

import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    return _prefs = await SharedPreferences.getInstance();
  }

  static setStringPreference(
      {required String preference, required String value}) {
    _prefs?.setString(preference, value);
  }

  static setBoolPreference({required String preference, required bool value}) {
    _prefs?.setBool(preference, value);
  }

  static setIntPreference({required String preference, required int value}) {
    _prefs?.setInt(preference, value);
  }

  static setDoublePreference(
      {required String preference, required double value}) {
    _prefs?.setDouble(preference, value);
  }

  static setStringListPreference(
      {required String preference, required List<String> value}) {
    _prefs?.setStringList(preference, value);
  }

  static getStringPreference({required String preference}) {
    return _prefs?.getString(preference);
  }

  static getBoolPreference({required String preference}) {
    return _prefs?.getBool(preference);
  }

  static getIntPreference({required String preference}) {
    return _prefs?.getInt(preference);
  }

  static getDoublePreference({required String preference}) {
    return _prefs?.getDouble(preference);
  }

  static getStringListPreference({required String preference}) {
    return _prefs?.getStringList(preference);
  }
}
