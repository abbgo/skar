import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/parts/price_range/price_range.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:skar/styles/colors.dart';

class RadioListTileWidget extends ConsumerWidget {
  const RadioListTileWidget(
      {super.key, required this.priceRange, required this.forSearchProduct});

  final PriceRangeClass priceRange;
  final bool forSearchProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedPriceRange = forSearchProduct
        ? ref.watch(searchProductPriceRangeProvider)
        : ref.watch(priceRangeProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return RadioListTile.adaptive(
      activeColor: isLightBrightness ? elevatedButtonColor : Colors.white,
      title: Text(priceRange.name),
      value: priceRange.range,
      groupValue: selectedPriceRange,
      onChanged: (value) => forSearchProduct
          ? ref.read(searchProductPriceRangeProvider.notifier).state = value!
          : ref.read(priceRangeProvider.notifier).state = value!,
    );
  }
}
