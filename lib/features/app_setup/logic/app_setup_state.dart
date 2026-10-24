import 'package:flutter/material.dart';

class AppSetupState {
  final ThemeMode themeMode;

  const AppSetupState({
    this.themeMode = ThemeMode.system,
  });

  AppSetupState copyWith({
    ThemeMode? themeMode,
  }) {
    return AppSetupState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}