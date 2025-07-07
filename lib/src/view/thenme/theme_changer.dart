import 'package:expence_tracker/src/view/thenme/theme_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChanger extends Cubit<ThemeData> {
  ThemeChanger() : super(ThemeDataSection.initalTheme());
  var currentTheme = ThemeDataSection.initalTheme();
  IconData themeIcon() {
    if (currentTheme == ThemeDataSection.darktheme) {
      return Icons.dark_mode;
    } else {
      return Icons.light_mode;
    }
  }

  // void setLightTheme() => emit(ThemeDataSection.lighttheme);
  // void setDarkTheme() => emit(ThemeDataSection.darktheme);
  void toggleTheme() {
    if (state.brightness == Brightness.dark) {
      // setLightTheme();
      emit(ThemeDataSection.lighttheme);
      currentTheme = ThemeDataSection.lighttheme;
    } else {
      emit(ThemeDataSection.darktheme);
      currentTheme = ThemeDataSection.darktheme;
    }
    themeIcon();
  }
}
