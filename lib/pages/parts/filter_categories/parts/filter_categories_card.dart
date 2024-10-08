import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/pages/parts/filter_categories/parts/category_check_box.dart';
import 'package:skar/pages/parts/filter_categories/parts/child_categories_check_box_list.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/filter_categories.dart';

class FilterCategoriesCard extends ConsumerWidget {
  const FilterCategoriesCard({super.key, required this.category});

  final Kategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(langProvider) == 'tr';
    List<String> selectedCategories = ref.watch(selectedCategoriesProvider);
    bool isSelected = selectedCategories.contains(category.id);

    return category.childCategories!.isEmpty
        ? CategoryCheckBox(
            category: category,
            isTM: isTM,
            isSelected: isSelected,
          )
        : ChildCategoriesCheckBoxList(category: category, isTM: isTM);
  }
}
