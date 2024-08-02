import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/parts/price_range/price_range.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:skar/styles/colors.dart';

class RadioListTileWidget extends ConsumerWidget {
  const RadioListTileWidget({super.key, required this.priceRange});

  final PriceRangeClass priceRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedPriceRange = ref.watch(priceRangeProvider);

    return RadioListTile.adaptive(
      activeColor: elevatedButtonColor,
      title: Text(priceRange.name),
      value: priceRange.range,
      groupValue: selectedPriceRange,
      onChanged: (value) =>
          ref.read(priceRangeProvider.notifier).state = value!,
    );
  }
}
