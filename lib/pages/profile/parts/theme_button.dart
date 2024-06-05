import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key, required this.text, required this.theme});

  final String text;
  final int theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedTheme = ref.read(themeProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:
              selectedTheme == theme ? elevatedButtonColor : Colors.white,
          elevation: 3,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: selectedTheme == theme ? Colors.white : elevatedButtonColor,
          ),
        ),
      ),
    );
  }
}
