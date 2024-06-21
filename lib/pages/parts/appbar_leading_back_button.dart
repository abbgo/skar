import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class AppBarLeadingBackButton extends ConsumerWidget {
  const AppBarLeadingBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor:
            isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      ),
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.adaptive.arrow_back),
    );
  }
}
