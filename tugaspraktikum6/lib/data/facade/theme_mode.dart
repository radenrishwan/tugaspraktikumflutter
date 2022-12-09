import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeFacade {
  final status = "THEMESTATUS";
  static final ThemeModeFacade _instance = ThemeModeFacade._();

  factory ThemeModeFacade() {
    return _instance;
  }

  ThemeModeFacade._();

  setMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(status, value);
  }

  Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(status) ?? false;
  }
}
