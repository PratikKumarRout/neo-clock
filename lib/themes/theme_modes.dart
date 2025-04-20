import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade200,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.grey.shade400,
    tertiary: Colors.green,
    inversePrimary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    onPrimary: Colors.grey.shade700.withAlpha((0.6 * 255).toInt()),
    secondary: Colors.cyanAccent,
    onSecondary: Colors.black.withAlpha((0.4 * 255).toInt()),
    tertiary: Colors.cyan,
    inversePrimary: Colors.white,
  ),
);
