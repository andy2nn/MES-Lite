import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF0969DA),
      onPrimary: Colors.white,
      secondary: Color(0xFF238636),
      onSecondary: Colors.white,
      surface: Color(0xFFF6F8FA),
      onSurface: Color(0xFF24292F),
      error: Color(0xFFD73A49),
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF6F8FA),
      foregroundColor: Color(0xFF24292F),
      elevation: 1,
      iconTheme: IconThemeData(color: Color(0xFF24292F)),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFFF6F8FA),
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF6F8FA),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xFF0969DA)),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF24292F)),
      bodySmall: TextStyle(color: Color(0xFF57606A)),
      titleMedium:
          TextStyle(color: Color(0xFF24292F), fontWeight: FontWeight.bold),
      labelLarge: TextStyle(color: Color(0xFF0969DA)),
      displaySmall: TextStyle(
          fontFamily: 'monospace', backgroundColor: Color(0xFFF0F0F0)),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF58A6FF),
      onPrimary: Color(0xFF0D1117),
      secondary: Color(0xFF56D364),
      onSecondary: Color(0xFF0D1117),
      surface: Color(0xFF1B222B),
      onSurface: Color(0xFFC9D1D9),
      error: Color(0xFFF85149),
      onError: Color(0xFF0D1117),
    ),
    scaffoldBackgroundColor: const Color(0xFF0D1117),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF161B22),
      foregroundColor: Color(0xFFC9D1D9),
      elevation: 1,
      iconTheme: IconThemeData(color: Color(0xFFC9D1D9)),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1B222B),
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1B222B),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xFF58A6FF)),
        foregroundColor: WidgetStateProperty.all(const Color(0xFF0D1117)),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFFC9D1D9)),
      bodySmall: TextStyle(color: Color(0xFF8B949E)),
      titleMedium:
          TextStyle(color: Color(0xFFC9D1D9), fontWeight: FontWeight.bold),
      labelLarge: TextStyle(color: Color(0xFF58A6FF)),
      displaySmall: TextStyle(
          fontFamily: 'monospace', backgroundColor: Color(0xFF161B22)),
    ),
  );
}
