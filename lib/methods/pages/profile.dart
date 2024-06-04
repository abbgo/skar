import 'package:flutter/material.dart';
import 'package:skar/pages/profile/parts/language_button.dart';

Future<dynamic> showLanguageMethod(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog.adaptive(
        backgroundColor: Colors.white,
        title: Text('Dil saylan', textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LanguageButton(text: 'Turkmen'),
            LanguageButton(text: 'Rus'),
          ],
        ),
      );
    },
  );
}
