import 'package:reminder_app/core/constants/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  SharedPreferences? _preferences;

  static final PreferencesManager _instance = PreferencesManager._init();

  static PreferencesManager get instance => _instance;

  PreferencesManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  String? getStringValue(PreferencesKeys key) =>
      _preferences?.getString(key.toString());

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  bool? getBoolValue(PreferencesKeys key) =>
      _preferences?.getBool(key.toString());
}
