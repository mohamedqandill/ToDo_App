import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
   late ThemeMode mode;

  static const String isDarkTheme = "Theme";

  final SharedPreferences prefs;

  ThemeProvider(this.prefs) {
    readSavedTheme();
  }

  void readSavedTheme() {
    var isDark = prefs.getBool(isDarkTheme) ?? false;
    mode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkTheme, mode == ThemeMode.dark);
  }

  changeTheme(ThemeMode themeMode) {
    mode = themeMode;

    notifyListeners();
    saveTheme();
  }
}
