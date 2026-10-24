import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/app_preferences.dart';
import 'app_setup_state.dart';

class AppSetupCubit extends Cubit<AppSetupState> {
  final AppPreferences _preferences;

  AppSetupCubit(this._preferences)
      : super(
    AppSetupState(
      themeMode: _readThemeMode(
        _preferences.themeMode,
      ),
    ),
  );

  static ThemeMode _readThemeMode(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;

      case 'dark':
        return ThemeMode.dark;

      default:
        return ThemeMode.system;
    }
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    emit(state.copyWith(themeMode: themeMode));

    final String value = switch (themeMode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };

    await _preferences.saveTheme(value);
  }
}