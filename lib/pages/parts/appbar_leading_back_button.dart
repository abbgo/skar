import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class AppBarLeadingBackButton extends StatelessWidget {
  const AppBarLeadingBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightBrightness = screenProperties(context).isLightBrightness;

    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor:
            isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      ),
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }
}
