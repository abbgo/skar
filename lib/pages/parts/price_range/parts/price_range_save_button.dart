import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceRangeSaveButton extends StatelessWidget {
  const PriceRangeSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: screenProperties(context).width,
        child: ElevatedButton(onPressed: () {}, child: Text(lang.select)),
      ),
    );
  }
}
