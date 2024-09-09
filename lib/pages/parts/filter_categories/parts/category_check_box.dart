import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/providers/pages/filter_categories.dart';
import 'package:skar/styles/colors.dart';

class CategoryCheckBox extends ConsumerWidget {
  const CategoryCheckBox({
    super.key,
    required this.category,
    required this.isTM,
    required this.isSelected,
  });

  final Kategory category;
  final bool isTM, isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      activeColor: elevatedButtonColor,
      value: isSelected,
      onChanged: (value) async {
        await ref
            .read(selectedCategoriesProvider.notifier)
            .addOrRemoveCategory(category.id);
      },
      title: Text(isTM ? category.nameTM : category.nameRU),
    );
  }
}
