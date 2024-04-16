import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showIntConnErrSnackBar(BuildContext context) {
  var snackBar = SnackBar(
    content: Text(AppLocalizations.of(context)!.noIntConn),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
