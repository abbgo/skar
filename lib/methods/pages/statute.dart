import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<Object?> warningShowGeneralDialog(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        lang.warning,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Text(lang.statuteDialogContent),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(lang.ok),
        ),
      ],
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

Padding columnOfListviewMethod(String title, String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(description),
      ],
    ),
  );
}
