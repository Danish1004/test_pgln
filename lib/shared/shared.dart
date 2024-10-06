import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();

  static final SharedPrefs _instance = SharedPrefs._();

  static SharedPrefs get instance => _instance;

  late SharedPreferences _prefs;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> remove(String key) async => await _prefs.remove(key);

  Future<void> clear() async => await _prefs.clear();

  /// Setters
  Future<bool> setToken(String value) async =>
      await _prefs.setString('authtoken', value);
  Future<bool> setUserId(int value) async =>
      await _prefs.setInt('userId', value);
  Future<bool> setUserEmail(String value) async =>
      await _prefs.setString('email', value);
  Future<bool> setUserPhone(String value) async =>
      await _prefs.setString('email', value);
  Future<bool> setFirstLaunch(bool value) async =>
      await _prefs.setBool('is_first_launch', false);
  Future<bool> setAppVersion(String value) async =>
      await _prefs.setString('app_version', value);
  Future<bool> setBuildNumber(String value) async =>
      await _prefs.setString('build_number', value);

  /// Getters
  String? getToken() => _prefs.getString('authtoken');
  int? getUserId() => _prefs.getInt('userId');
  bool getFirstLaunch() => _prefs.getBool('is_first_launch') ?? true;
  String appVersion() => _prefs.getString('app_version') ?? "";
  String buildNumber() => _prefs.getString('app_version') ?? "";
  String appVersionCode() => '(v${_prefs.getString('app_version') ?? ""})';
}
