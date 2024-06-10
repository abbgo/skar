import 'package:flutter/material.dart';

class AppFloatingActionButtonTheme {
  AppFloatingActionButtonTheme._();

  static FloatingActionButtonThemeData lightFloatingActionButtonTheme =
      FloatingActionButtonThemeData(
    backgroundColor: Colors.black.withOpacity(.1),
    elevation: 3,
  );

  static FloatingActionButtonThemeData darkFloatingActionButtonTheme =
      FloatingActionButtonThemeData(
    backgroundColor: Colors.white.withOpacity(.3),
    elevation: 3,
  );
}
