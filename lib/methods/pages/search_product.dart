import 'package:flutter/material.dart';
import 'package:skar/pages/parts/sort_product/sort_product.dart';

showSortProductBottomSheet(BuildContext context, bool forSearchProduct) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SortProduct(forSearchProduct: forSearchProduct),
  );
}
