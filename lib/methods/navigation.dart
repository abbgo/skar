import 'package:flutter/material.dart';

goToPage(
  BuildContext context,
  Widget page,
  bool forReplace,
) {
  return context.mounted
      ? forReplace
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
      : null;
}
