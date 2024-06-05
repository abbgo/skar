import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/profile/parts/theme_button.dart';

Future<dynamic> showThemeMethod(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.selectTheme,
          textAlign: TextAlign.center,
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeButton(text: 'Turkmen', lang: 'tr'),
            ThemeButton(text: 'Русский', lang: 'ru'),
          ],
        ),
      );
    },
  );
}
