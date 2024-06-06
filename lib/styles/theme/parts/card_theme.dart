import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardTheme lightCardTheme = CardTheme(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: dialogColorDarkTheme,
  );

  static CardTheme darkCardTheme = CardTheme(
    color: dialogColorDarkTheme,
    surfaceTintColor: dialogColorDarkTheme,
    shadowColor: Colors.white,
  );
}
