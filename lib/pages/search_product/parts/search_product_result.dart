import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/params/product_param.dart';

class SearchProductResult extends ConsumerWidget {
  const SearchProductResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String search = ref.watch(productSearchProvider);
    bool hasProducts = ref.watch(hasProductsProvider);

    return Expanded(
      child: search != ''
          ? !hasProducts
              ? const NoResult()
              : const Center(
                  child: Text('rasult products'),
                )
          : const SizedBox(),
    );
  }
}
