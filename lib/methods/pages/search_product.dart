import 'package:flutter/material.dart';
import 'package:skar/pages/parts/sort_product/sort_product.dart';

showSortProductBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const SortProduct(),
  );
}
