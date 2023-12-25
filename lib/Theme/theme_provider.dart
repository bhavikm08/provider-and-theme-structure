import 'package:flutter/material.dart';
import 'package:providerstructure/Common/string_constant.dart';
import 'package:providerstructure/Theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool themeModeSwitch = false;
  ThemeData themeData = lightMode;

  ThemeProvider() {
    loadThemeMode();
  }
  Future<void> toggleSwitch({required bool value}) async {
    themeModeSwitch = value;
    themeData = (themeModeSwitch == true) ? darkMode : lightMode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(StringConstant.themeModeSaved, themeModeSwitch);
    notifyListeners();
  }
  applyTheme({Color? selectedColor}) async {
    ThemeData updatedTheme = themeModeSwitch ? darkMode : lightMode;
    updatedTheme = updatedTheme.copyWith(
      focusColor: selectedColor,
      textTheme: updatedTheme.textTheme.copyWith(
        bodyLarge: updatedTheme.textTheme.bodyLarge!.copyWith(
          color: selectedColor,
        ),
      ),
    );
    themeData = updatedTheme;
    await saveTheme(
        key: 'selectedTextColor',
        value: selectedColor!.value);
    notifyListeners();
  }
  Future<void> saveTheme({required String key, required int value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final Brightness systemBrightness =
        WidgetsBinding.instance.window.platformBrightness;
    themeModeSwitch = prefs.getBool(StringConstant.themeModeSaved) ??
        (systemBrightness == Brightness.dark);

    final selectedColorValue = prefs.getInt('selectedTextColor');
    final selectedColor = Color(selectedColorValue!);

    themeData = themeModeSwitch ? darkMode : lightMode;
    themeData = themeData.copyWith(
      focusColor: selectedColor,
      textTheme: themeData.textTheme.copyWith(
        bodyLarge: themeData.textTheme.bodyLarge!.copyWith(
          color: selectedColor,
        ),
      ),
    );

    notifyListeners();
  }
}
