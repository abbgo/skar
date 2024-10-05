import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterCategoriesSaveButton extends StatelessWidget {
  const FilterCategoriesSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Container(
      width: screenProperties(context).width,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Text(lang.select),
      ),
    );
  }
}
