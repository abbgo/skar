import 'package:flutter/material.dart';

class AppBottomNavigationBar {
  AppBottomNavigationBar._();

  static const BottomNavigationBarThemeData lightBottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: Color(0xff1e4a71),
    unselectedItemColor: Color(0xff1e4a71),
  );

  static const BottomNavigationBarThemeData darkBottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  );
}
