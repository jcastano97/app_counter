import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      color: Colors.grey,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.green,
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Colors.white10,
      selectedLabelTextStyle: TextStyle(
        color: Colors.white30,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      color: Colors.grey,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
