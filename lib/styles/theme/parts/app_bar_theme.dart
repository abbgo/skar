import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'HeyWowRegular',
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    centerTitle: true,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: scaffoldColorDarkTheme,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: const TextStyle(
      fontFamily: 'HeyWowRegular',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    centerTitle: true,
  );
}
