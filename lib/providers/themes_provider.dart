import 'package:flutter/material.dart';
import 'package:math_time/themes/theme_modes.dart';

class ThemesProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themesData) {
    _themeData = themesData;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = _themeData == lightMode ? darkMode : lightMode;
  }
}
