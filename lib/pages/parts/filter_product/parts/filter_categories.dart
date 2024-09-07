import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterCategories extends StatelessWidget {
  const FilterCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ListTile(
      title: Text(
        lang.categories,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.adaptive.arrow_forward),
      onTap: () {},
    );
  }
}
