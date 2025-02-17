import 'package:flutter/material.dart';
import 'package:weather_app/services/theme_persistance.dart';
import 'package:weather_app/utils/themes.dart';

class ThemeProviders extends ChangeNotifier {
  ThemeProviders() {
    _loadTheme();
  }

  ThemeData _themeData = ThemesModeData().lightTheme;

  final ThemePersistance themePersistance = ThemePersistance();

  //get theme
  ThemeData get getThemeData => _themeData;

  //set theme
  set getThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  //load theme from shared preferences
  Future<void> _loadTheme() async {
    bool isDark = await themePersistance.getTheme();
    getThemeData =
        isDark ? ThemesModeData().darkTheme : ThemesModeData().lightTheme;
  }

  //toggle theme
  Future<void> toggleTheme(bool isDark) async {
    getThemeData =
        isDark ? ThemesModeData().darkTheme : ThemesModeData().lightTheme;

    await themePersistance.storeTheme(isDark);
  }
}
