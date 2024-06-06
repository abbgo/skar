import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardTheme lightCardTheme = CardTheme(
    elevation: 3,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: dialogColorDarkTheme,
  );

  static CardTheme darkCardTheme = CardTheme(
    elevation: 3,
    color: dialogColorDarkTheme,
    surfaceTintColor: dialogColorDarkTheme,
    shadowColor: Colors.white,
  );
}
