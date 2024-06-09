import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/models/theme.dart';
import 'package:skar/pages/profile/parts/theme_button.dart';

Future<dynamic> showThemeMethod(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      var lang = AppLocalizations.of(context)!;
      return AlertDialog.adaptive(
        title: Text(lang.selectTheme, textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeButton(text: lang.systemTheme, theme: ThemeType.system),
            ThemeButton(text: lang.whiteTheme, theme: ThemeType.white),
            ThemeButton(text: lang.blackTheme, theme: ThemeType.black),
          ],
        ),
      );
    },
  );
}
