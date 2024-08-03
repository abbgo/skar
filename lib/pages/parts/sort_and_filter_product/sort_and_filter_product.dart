import 'package:flutter/material.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/search_product.dart';
import 'package:skar/pages/parts/filter_product/filter_product.dart';
import 'package:skar/pages/parts/sort_and_filter_product/parts/icon_body.dart';

class SortAndFilterProduct extends StatelessWidget {
  const SortAndFilterProduct({
    super.key,
    required this.text,
    required this.icon,
    required this.forSort,
    required this.forSearchProduct,
  });

  final String text;
  final IconData icon;
  final bool forSort;
  final bool forSearchProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: forSort
          ? () => showSortProductBottomSheet(context)
          : () => Navigator.push(
                context,
                CustomPageRoute(
                  child: FilterProduct(forSearchProduct: forSearchProduct),
                  direction: AxisDirection.up,
                ),
              ),
      child: IconBody(text: text, icon: icon),
    );
  }
}
