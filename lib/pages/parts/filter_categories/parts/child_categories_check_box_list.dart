import 'package:flutter/material.dart';
import 'package:skar/models/category.dart';

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
      title: Text(isTM ? category.nameTM : category.nameRU),
    );
  }
}
