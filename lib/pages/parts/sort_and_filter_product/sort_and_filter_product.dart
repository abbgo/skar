import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/search_product.dart';
import 'package:skar/notifiers/pages/filter_genders.dart';
import 'package:skar/pages/parts/filter_product/filter_product.dart';
import 'package:skar/pages/parts/sort_and_filter_product/parts/icon_body.dart';

class SortAndFilterProduct extends StatelessWidget {
  const SortAndFilterProduct({
    super.key,
    required this.text,
    required this.icon,
    required this.forSort,
    required this.forSearchProduct,
    required this.provider,
  });

  final String text;
  final IconData icon;
  final bool forSort;
  final bool forSearchProduct;
  final StateNotifierProvider<SelectedProductGendersNotifier, List<dynamic>>
      provider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: forSort
            ? () => showSortProductBottomSheet(context, forSearchProduct)
            : () => Navigator.push(
                  context,
                  CustomPageRoute(
                    child: FilterProduct(
                      forSearchProduct: forSearchProduct,
                      provider: provider,
                    ),
                    direction: AxisDirection.up,
                  ),
                ),
        child: IconBody(text: text, icon: icon, forSort: forSort),
      ),
    );
  }
}
