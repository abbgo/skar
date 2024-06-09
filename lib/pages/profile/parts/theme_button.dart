import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key, required this.text, required this.theme});

  final String text;
  final int theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = screenProperties(context).isLightBrightness;
    int selectedTheme = ref.read(themeProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedTheme == theme
              ? elevatedButtonColor
              : isLightBrightness
                  ? Colors.white
                  : dialogColorDarkTheme,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: selectedTheme == theme
                ? Colors.white
                : isLightBrightness
                    ? elevatedButtonColor
                    : Colors.white,
          ),
        ),
      ),
    );
  }
}
