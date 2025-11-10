import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences prefs;
  static const _key = 'theme_mode';

  ThemeCubit(this.prefs) : super(ThemeMode.system) {
    _loadTheme();
  }

  void _loadTheme() {
    final saved = prefs.getString(_key);
    switch (saved) {
      case 'light':
        emit(ThemeMode.light);
        break;
      case 'dark':
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    await prefs.setString(_key, mode.name);
    emit(mode);
  }
}
