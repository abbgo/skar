import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';

class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.only(top: 0, left: 20),
    enabledBorder: outlinedInputBorder(),
  );

  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    fillColor: dialogColorDarkTheme,
    filled: true,
    contentPadding: const EdgeInsets.only(top: 0, left: 20),
    focusedBorder: outlinedInputBorder(),
  );
}

OutlineInputBorder outlinedInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: elevatedButtonColor),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
}
