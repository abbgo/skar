import 'package:flutter/material.dart';
import 'package:skar/pages/parts/filter_product/filter_product.dart';
import 'package:skar/pages/parts/sort_product/sort_product.dart';

showSortProductBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const SortProduct(),
  );
}

showFilterProductBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const FilterProduct(),
  );
}
