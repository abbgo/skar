import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/filter_categories/parts/filter_categories_save_button.dart';
import 'package:skar/pages/parts/filter_categories/parts/result_filter_categories.dart';

class FilterCategoriesPage extends StatelessWidget {
  const FilterCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.categories),
      ),
      body: const Column(
        children: [
          Expanded(child: ResultFilterCategories()),
          FilterCategoriesSaveButton(),
        ],
      ),
    );
  }
}
