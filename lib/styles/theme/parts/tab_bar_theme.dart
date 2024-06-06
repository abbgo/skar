import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static TabBarTheme lightTabBarTheme = TabBarTheme(
    labelPadding: const EdgeInsets.only(bottom: 10),
    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
    labelColor: elevatedButtonColor,
    indicatorColor: elevatedButtonColor,
    dividerColor: Colors.white,
  );

  static TabBarTheme darkTabBarTheme = TabBarTheme(
    labelPadding: const EdgeInsets.only(bottom: 10),
    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
    labelColor: Colors.white,
    indicatorColor: Colors.white,
    dividerColor: scaffoldColorDarkTheme,
  );
}
