import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavigationBarItemMethod(
  String label,
  Widget icon,
  Color? backgroundColor,
) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
    backgroundColor: backgroundColor,
  );
}
