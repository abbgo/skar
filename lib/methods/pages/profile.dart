import 'package:flutter/material.dart';

Future<dynamic> showLanguageMethod(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        backgroundColor: Colors.white,
        title: const Text('Dil saylan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Turkmen'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Rus'),
            ),
          ],
        ),
      );
    },
  );
}
