import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/filter_categories.dart';
import 'package:skar/styles/colors.dart';

class FilterCategoriesCard extends ConsumerWidget {
  const FilterCategoriesCard({super.key, required this.category});

  final Kategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(langProvider) == 'tr';
    List<String> selectedCategories = ref.watch(selectedCategoriesProvider);
    bool isSelected = selectedCategories.contains(category.id);

    return category.childCategories!.isEmpty
        ? CheckboxListTile(
            activeColor: elevatedButtonColor,
            value: isSelected,
            onChanged: (value) async {
              await ref
                  .read(selectedCategoriesProvider.notifier)
                  .addOrRemoveCategory(category.id);
            },
            title: Text(isTM ? category.nameTM : category.nameRU),
          )
        : ExpansionTile(
            title: Text(isTM ? category.nameTM : category.nameRU),
          );
  }
}
