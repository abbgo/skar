import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/styles/theme/parts/app_bar_theme.dart';
import 'package:skar/styles/theme/parts/bottom_navigation_bar_theme.dart';
import 'package:skar/styles/theme/parts/card_theme.dart';
import 'package:skar/styles/theme/parts/checkbox_theme.dart';
import 'package:skar/styles/theme/parts/elevated_button_theme.dart';
import 'package:skar/styles/theme/parts/floating_action_button_theme.dart';
import 'package:skar/styles/theme/parts/icon_button_theme.dart';
import 'package:skar/styles/theme/parts/input_theme.dart';
import 'package:skar/styles/theme/parts/tab_bar_theme.dart';
import 'package:skar/styles/theme/parts/text_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'HeyWowRegular',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckBoxTheme.checkboxThemeData,
    dialogBackgroundColor: Colors.white,
    bottomNavigationBarTheme:
        AppBottomNavigationBar.lightBottomNavigationBarThemeData,
    iconButtonTheme: AppIconButtonTheme.lightIconButtonTheme,
    inputDecorationTheme: AppInputTheme.lightInputTheme,
    cardTheme: AppCardTheme.lightCardTheme,
    tabBarTheme: AppTabBarTheme.lightTabBarTheme,
    floatingActionButtonTheme:
        AppFloatingActionButtonTheme.lightFloatingActionButtonTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'HeyWowRegular',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: scaffoldColorDarkTheme,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckBoxTheme.checkboxThemeData,
    dialogBackgroundColor: dialogColorDarkTheme,
    bottomNavigationBarTheme:
        AppBottomNavigationBar.darkBottomNavigationBarThemeData,
    iconButtonTheme: AppIconButtonTheme.darkIconButtonTheme,
    inputDecorationTheme: AppInputTheme.darkInputTheme,
    cardTheme: AppCardTheme.darkCardTheme,
    tabBarTheme: AppTabBarTheme.darkTabBarTheme,
    floatingActionButtonTheme:
        AppFloatingActionButtonTheme.darkFloatingActionButtonTheme,
  );
}
