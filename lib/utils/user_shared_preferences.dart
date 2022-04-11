import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyStatus = '_status';
  static const _keyStatusCode = '_statusCode';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setStatus(bool status) async =>
      await _preferences.setBool(_keyStatus, status);

  static bool? getStatus() => _preferences.getBool(_keyStatus);

  static Future setStatusCode(int statusCode) async =>
      await _preferences.setInt(_keyStatusCode, statusCode);

  static int? getStatusCode() => _preferences.getInt(_keyStatusCode);
}
