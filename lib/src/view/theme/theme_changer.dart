// import 'package:expence_tracker/src/view/thenme/theme_data_section.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ThemeChanger extends Cubit<ThemeData> {
//   ThemeChanger() : super(ThemeDataSection.initalTheme());
//   var currentTheme = ThemeDataSection.initalTheme();
//   IconData themeIcon() {
//     if (currentTheme == ThemeDataSection.darktheme) {
//       return Icons.dark_mode;
//     } else {
//       return Icons.light_mode;
//     }
//   }

//   // void setLightTheme() => emit(ThemeDataSection.lighttheme);
//   // void setDarkTheme() => emit(ThemeDataSection.darktheme);
//   void toggleTheme() {
//     if (state.brightness == Brightness.dark) {
//       // setLightTheme();
//       emit(ThemeDataSection.lighttheme);
//       currentTheme = ThemeDataSection.lighttheme;
//     } else {
//       emit(ThemeDataSection.darktheme);
//       currentTheme = ThemeDataSection.darktheme;
//     }
//     // box.deleteAt(0);
//     // box.putAt(0, currentTheme);
//     themeIcon();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends Cubit<ThemeMode> {
  ThemeChanger() : super(ThemeMode.system) {
    _onload();
  }
  ThemeMode currentTheme = ThemeMode.system;

  Future<void> _onload() async {
    final themeCache = await SharedPreferences.getInstance();
    final themeIndex = themeCache.getInt("theme");
    if (themeIndex == 1) {
      currentTheme = ThemeMode.light;

      emit(ThemeMode.light);
    } else if (themeIndex == 2) {
      currentTheme = ThemeMode.dark;

      emit(ThemeMode.dark);
    } else {
      currentTheme = ThemeMode.system;
      emit(ThemeMode.system);
    }
  }

  Future<void> _saveTheme(int theme) async {
    final themeCache = await SharedPreferences.getInstance();
    await themeCache.setInt("theme", theme);
  }

  void toggleTheme(BuildContext context) async {
    if (currentTheme == ThemeMode.system &&
        MediaQuery.of(context).platformBrightness == Brightness.dark) {
      currentTheme = ThemeMode.light;

      emit(ThemeMode.light);
      await _saveTheme(1);
    } else if (currentTheme == ThemeMode.system &&
        MediaQuery.of(context).platformBrightness == Brightness.light) {
      currentTheme = ThemeMode.dark;

      emit(ThemeMode.dark);
      await _saveTheme(2);
    } else if (currentTheme == ThemeMode.dark) {
      currentTheme = ThemeMode.light;

      emit(ThemeMode.light);
      await _saveTheme(1);
    } else {
      currentTheme = ThemeMode.dark;
      emit(ThemeMode.dark);
      await _saveTheme(2);
    }
  }
}
