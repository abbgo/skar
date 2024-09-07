import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/filter_categories/filter_categories.dart';

class FilterCategoriesButton extends StatelessWidget {
  const FilterCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ListTile(
      title: Text(
        lang.categories,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.adaptive.arrow_forward),
      onTap: () => Navigator.push(
        context,
        CustomPageRoute(
          child: const FilterCategoriesPage(),
          direction: AxisDirection.left,
        ),
      ),
    );
  }
}
