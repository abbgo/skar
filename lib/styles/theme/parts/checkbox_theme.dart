import 'package:flutter/material.dart';

class AppCheckBoxTheme {
  AppCheckBoxTheme._();

  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    checkColor: const WidgetStatePropertyAll(Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
