import 'package:flutter/material.dart';

class ThemeDataSection {
  // ThemeDataSection._();

  static final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    listTileTheme: ListTileThemeData(
      textColor: Colors.black,
      style: ListTileStyle.drawer,
    ),
    scaffoldBackgroundColor: Colors.white,

    textTheme: TextTheme(
      bodySmall: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      bodyLarge: const TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    ),
    cardTheme: const CardThemeData(
      surfaceTintColor: Colors.limeAccent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: Color(0xffF5F5F5),
      backgroundColor: Colors.white,

      selectedIconTheme: IconThemeData(
        color: Colors.teal,
        // selectedItemColor:,
      ),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      elevation: 10,
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,

      indicatorColor: Colors.black,
      indicator: BoxDecoration(
        border: Border.all(width: 2, color: Colors.teal),

        borderRadius: BorderRadius.circular(15),
      ),
      indicatorSize: TabBarIndicatorSize.tab,

      indicatorAnimation: TabIndicatorAnimation.elastic,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade700,
    ),

    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    listTileTheme: ListTileThemeData(
      textColor: Colors.white,
      style: ListTileStyle.list,
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    cardTheme: const CardThemeData(
      surfaceTintColor: Colors.limeAccent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: Colors.black12,
      backgroundColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.lightGreenAccent),
      selectedItemColor: Colors.lightGreenAccent,

      unselectedIconTheme: IconThemeData(color: Colors.white),
      unselectedItemColor: Colors.white,
      elevation: 10,
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
  );
}
