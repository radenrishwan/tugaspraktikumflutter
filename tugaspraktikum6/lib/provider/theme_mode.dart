import 'package:flutter/material.dart';
import 'package:tugaspraktikum6/data/facade/theme_mode.dart';

class ThemeModeProvider extends ChangeNotifier {
  final ThemeModeFacade _themeModeFacade = ThemeModeFacade();
  bool darkMode = false;

  void setDarkMode(bool value) {
    darkMode = value;
    _themeModeFacade.setMode(value);
    notifyListeners();
  }
}
