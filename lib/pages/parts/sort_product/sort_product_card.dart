import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:skar/styles/colors.dart';

class SortProductCard extends ConsumerWidget {
  const SortProductCard({super.key, required this.text, required this.value});

  final String text;
  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String sortProductPrice = ref.watch(sortProductPriceProvider);

    return Card(
      child: RadioListTile(
        activeColor: elevatedButtonColor,
        title: Text(text),
        value: value,
        groupValue: sortProductPrice,
        onChanged: (value) =>
            ref.read(sortProductPriceProvider.notifier).state = value!,
      ),
    );
  }
}
