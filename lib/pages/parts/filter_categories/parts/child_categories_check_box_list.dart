import 'package:flutter/material.dart';
import 'package:skar/models/category.dart';
import 'package:skar/pages/parts/filter_categories/parts/filter_categories_card.dart';
import 'package:skar/styles/colors.dart';

class ChildCategoriesCheckBoxList extends StatelessWidget {
  const ChildCategoriesCheckBoxList({
    super.key,
    required this.category,
    required this.isTM,
  });

  final Kategory category;
  final bool isTM;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(right: 32),
      collapsedIconColor: elevatedButtonColor,
      iconColor: elevatedButtonColor,
      title: Text(isTM ? category.nameTM : category.nameRU),
      children: category.childCategories!
          .map((e) => FilterCategoriesCard(category: e))
          .toList(),
    );
  }
}
