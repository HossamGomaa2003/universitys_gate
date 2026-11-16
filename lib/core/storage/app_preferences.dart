import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppPreferences {
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language_code';
  static const String _setupCompleteKey = 'is_setup_complete';

  static const String _profileImageKey = 'profile_image_path';

  final SharedPreferences _preferences;

  AppPreferences(this._preferences);

  String get languageCode {
    return _preferences.getString(_languageKey) ?? 'en';
  }

  String get themeMode {
    return _preferences.getString(_themeKey) ?? 'system';
  }

  bool get isSetupComplete {
    return _preferences.getBool(_setupCompleteKey) ?? false;
  }

  String? get profileImagePath {
    return _preferences.getString(_profileImageKey);
  }

  Future<void> saveLanguage(String languageCode) async {
    await _preferences.setString(
      _languageKey,
      languageCode,
    );
  }

  Future<void> saveTheme(String themeMode) async {
    await _preferences.setString(
      _themeKey,
      themeMode,
    );
  }

  Future<void> setSetupComplete(bool complete) async {
    await _preferences.setBool(_setupCompleteKey, complete);
  }

  Future<void> saveProfileImagePath(String path) async {
    await _preferences.setString(_profileImageKey, path);
  }
}
