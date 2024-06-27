import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

void showIntConnErr(BuildContext context) {
  var snackBar = SnackBar(
    content: Text(
      AppLocalizations.of(context)!.noIntConn,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showTopSnackbar(
  BuildContext context,
  String text,
) {
  SnackBar snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: elevatedButtonColor,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: screenProperties(context).height - 150,
      left: 10,
      right: 10,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
