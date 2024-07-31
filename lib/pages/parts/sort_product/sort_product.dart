import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';

class SortProduct extends ConsumerWidget {
  const SortProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String sortProductPrice = ref.watch(sortProductPriceProvider);

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          RadioListTile(
            value: '0-1',
            groupValue: sortProductPrice,
            onChanged: (value) =>
                ref.read(sortProductPriceProvider.notifier).state = value!,
          ),
          RadioListTile(
            value: '1-0',
            groupValue: sortProductPrice,
            onChanged: (value) =>
                ref.read(sortProductPriceProvider.notifier).state = value!,
          ),
        ],
      ),
    );
  }
}
