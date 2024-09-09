import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/filter_categories/filter_categories.dart';
import 'package:skar/providers/api/category.dart';
import 'package:skar/services/category.dart';

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
      subtitle: Consumer(
        builder: (context, ref, child) {
          List<ShopCategories> selectedFilterCategories =
              ref.watch(shopCategoriesProvider);

          String categoryNames = '';
          int categoriesLenght = selectedFilterCategories.length;

          for (var i = 0; i < categoriesLenght; i++) {
            categoryNames += i != categoriesLenght - 1
                ? '${selectedFilterCategories[i].name} , '
                : selectedFilterCategories[i].name;
          }

          return Text(categoryNames);
        },
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
