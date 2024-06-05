import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static final TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(color: Colors.black),
    headlineMedium: const TextStyle().copyWith(color: Colors.black),
    headlineSmall: const TextStyle().copyWith(color: Colors.black),
    titleLarge: const TextStyle().copyWith(color: Colors.black),
    titleMedium: const TextStyle().copyWith(color: Colors.black),
    titleSmall: const TextStyle().copyWith(color: Colors.black),
    bodyLarge: const TextStyle().copyWith(color: Colors.black),
    bodyMedium: const TextStyle().copyWith(color: Colors.black),
    bodySmall: const TextStyle().copyWith(color: Colors.black),
    labelLarge: const TextStyle().copyWith(color: Colors.black),
    labelMedium: const TextStyle().copyWith(color: Colors.black),
    labelSmall: const TextStyle().copyWith(color: Colors.black),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(color: Colors.white),
    headlineMedium: const TextStyle().copyWith(color: Colors.white),
    headlineSmall: const TextStyle().copyWith(color: Colors.white),
    titleLarge: const TextStyle().copyWith(color: Colors.white),
    titleMedium: const TextStyle().copyWith(color: Colors.white),
    titleSmall: const TextStyle().copyWith(color: Colors.white),
    bodyLarge: const TextStyle().copyWith(color: Colors.white),
    bodyMedium: const TextStyle().copyWith(color: Colors.white),
    bodySmall: const TextStyle().copyWith(color: Colors.white),
    labelLarge: const TextStyle().copyWith(color: Colors.white),
    labelMedium: const TextStyle().copyWith(color: Colors.white),
    labelSmall: const TextStyle().copyWith(color: Colors.white),
  );
}
