import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_boilerplate_code/Helper/ThemeConstants.dart';

enum ThemeType { Light, Dark }

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme;
  ThemeType _themeType;
  String currentThemeString;
  getTheme() {
    return currentThemeString;
  }

  toggleTheme() {
    if (_themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      _themeType = ThemeType.Light;
      currentThemeString = "Light";
      return notifyListeners();
    }

    if (_themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      _themeType = ThemeType.Dark;
      currentThemeString = "Dark";
      return notifyListeners();
    }
  }
  ThemeModel()
  {
    initTheme();
  }

  initTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentThemeString = (prefs.getString('theme') ?? "Light");
    setTheme(currentThemeString);
  }

  setTheme(String selectedTheme) async {
    if (selectedTheme == null || selectedTheme == '') {
      currentTheme = lightTheme;
      _themeType = ThemeType.Light;
      currentThemeString="Light";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', currentThemeString);
      return notifyListeners();
    } else {
      switch (selectedTheme) {
        case "Light":
          {
            currentTheme = lightTheme;
            _themeType = ThemeType.Light;
            currentThemeString = "Light";

          }
          break;

        case "Dark":
          {
            currentTheme = darkTheme;
            _themeType = ThemeType.Dark;
            currentThemeString = "Dark";

          }
          break;

        case "LightOswald":
          {
            currentTheme = lightThemeOswald;
            _themeType = ThemeType.Light;
            currentThemeString = "LightOswald";

          }
          break;

        case "DarkOswald":
          {
            currentTheme = darkThemeOswald;
            _themeType = ThemeType.Dark;
            currentThemeString = "DarkOswald";

          }
          break;

        case "LightTeko":
          {
            currentTheme = lightThemeTeko;
            _themeType = ThemeType.Light;
            currentThemeString = "LightTeko";

          }
          break;

        case "DarkTeko":
          {
            currentTheme = darkThemeTeko;
            _themeType = ThemeType.Dark;
            currentThemeString = "DarkTeko";

          }
          break;
        default:
          {
            currentTheme = lightThemeTeko;
            _themeType = ThemeType.Light;
            currentThemeString = "LightTeko";

          }
          break;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', currentThemeString);
      return notifyListeners();
    }
  }
}
