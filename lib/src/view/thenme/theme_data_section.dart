import 'package:flutter/material.dart';

class ThemeDataSection {
  ThemeDataSection._();
  static final lighttheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodySmall: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black),
      // titleLarge: TextStyle(color: Colors.black),
      bodyLarge: const TextStyle(color: Colors.black),
      // titleMedium: TextStyle(color: Colors.black),
      // titleSmall: TextStyle(color: Colors.black),
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorColor: Colors.black,
      indicator: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),

        borderRadius: BorderRadius.circular(15),
      ),
      indicatorSize: TabBarIndicatorSize.tab,

      indicatorAnimation: TabIndicatorAnimation.elastic,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade800,
    ),

    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(color: Colors.black),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    ),
  );

  static final darktheme = ThemeData.dark().copyWith(
    cardTheme: const CardThemeData(
      surfaceTintColor: Colors.limeAccent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorColor: Colors.white,
      indicator: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),

        borderRadius: BorderRadius.circular(15),
      ),
      indicatorSize: TabBarIndicatorSize.tab,

      indicatorAnimation: TabIndicatorAnimation.elastic,
      labelColor: Colors.limeAccent,
    ),

    iconTheme: const IconThemeData(color: Colors.black),
  );
}
