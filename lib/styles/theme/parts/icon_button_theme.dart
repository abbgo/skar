import 'package:flutter/material.dart';

class AppIconButtonTheme {
  AppIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(backgroundColor: Colors.white),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(backgroundColor: Colors.black),
  );
}
