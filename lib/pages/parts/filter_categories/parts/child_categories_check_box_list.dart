import 'package:flutter/material.dart';
import 'package:skar/models/category.dart';
import 'package:skar/pages/parts/filter_categories/parts/category_check_box.dart';

class ChildCategoriesCheckBoxList extends StatelessWidget {
  const ChildCategoriesCheckBoxList({
    super.key,
    required this.category,
    required this.isTM,
    required this.isSelected,
  });

  final Kategory category;
  final bool isTM, isSelected;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(isTM ? category.nameTM : category.nameRU),
      children: category.childCategories!
          .map(
            (e) => CategoryCheckBox(
              category: e,
              isTM: isTM,
              isSelected: isSelected,
            ),
          )
          .toList(),
    );
  }
}
