// ignore_for_file: constant_identifier_names

import 'package:pingolearn_assignment/shared/models/authentication/login_data.dart';
import 'package:pingolearn_assignment/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String SESSION_PREFERENCES_FILE = 'session_pref_file';
  static const String SESSION_AUTH_TOKEN = 'auth_token';
  static const String SESSION_USER_EMAIL = 'email';
  static const String SESSION_USER_PROFILE_ID = 'profile_id';
  static const String SESSION_USER_NAME = 'name';
  static const String SESSION_USER_PHONE = 'phone';

  static const String SESSION_IS_LOGGED_IN = 'is_logged_in';

  static const String SESSION_IS_FIRST_LAUNCH = 'is_first_launch';

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> createLoginSession(
    LoginData loginData,
  ) async {
    await _prefs.setString(SESSION_AUTH_TOKEN, loginData.authToken);
    await _prefs.setString(SESSION_USER_EMAIL, loginData.email ?? '');
    await _prefs.setString(SESSION_USER_NAME, loginData.name ?? '');
    await _prefs.setString(SESSION_USER_PHONE, loginData.phone ?? '');
    await _prefs.setBool(SESSION_IS_FIRST_LAUNCH, false);
    await SharedPrefs.instance.setFirstLaunch(false);
    await _prefs.setBool(SESSION_IS_LOGGED_IN, true);
  }

  static bool isLoggedIn() {
    return _prefs.getBool(SESSION_IS_LOGGED_IN) ?? false;
  }

  static bool isFirstLaunch() {
    return _prefs.getBool(SESSION_IS_FIRST_LAUNCH) ?? true;
  }

  static String getEmail() {
    return _prefs.getString(SESSION_USER_EMAIL) ?? '';
  }

  static String getName() {
    return _prefs.getString(SESSION_USER_NAME) ?? '';
  }

  static String getPhoneNumber() {
    return _prefs.getString(SESSION_USER_PHONE) ?? '';
  }

  static String getAuthToken() {
    return _prefs.getString(SESSION_AUTH_TOKEN) ?? '';
  }

  static Future<void> clearSession() async {
    await _prefs.setBool(SESSION_IS_LOGGED_IN, false);
  }
}
