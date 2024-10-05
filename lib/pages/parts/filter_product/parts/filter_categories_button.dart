import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/filter_categories/filter_categories.dart';
import 'package:skar/providers/api/category.dart';
import 'package:skar/providers/pages/filter_categories.dart';
import 'package:skar/services/category.dart';

class FilterCategoriesButton extends ConsumerWidget {
  const FilterCategoriesButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String categoryNames = '';
    var lang = AppLocalizations.of(context)!;
    List<ShopCategories> selectedFilterCategories =
        ref.watch(filterCategoriesProvider);

    if (selectedFilterCategories.isNotEmpty) {
      int categoriesLenght = selectedFilterCategories.length;
      for (var i = 0; i < categoriesLenght; i++) {
        categoryNames += i != categoriesLenght - 1
            ? '${selectedFilterCategories[i].name} , '
            : selectedFilterCategories[i].name;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 25, top: 10),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          CustomPageRoute(
            child: const FilterCategoriesPage(),
            direction: AxisDirection.left,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.categories,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  categoryNames == '' ? const SizedBox() : Text(categoryNames)
                ],
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                categoryNames == ''
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () async {
                          await ref
                              .read(selectedCategoriesProvider.notifier)
                              .removeAllFilterCategory();

                          await ref
                              .read(filterCategoriesProvider.notifier)
                              .removeAllFilterCategories();
                        },
                        child: const Icon(Icons.clear),
                      ),
                const SizedBox(width: 20),
                Icon(Icons.adaptive.arrow_forward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
