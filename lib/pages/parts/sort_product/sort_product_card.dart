import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:skar/styles/colors.dart';

class SortProductCard extends ConsumerWidget {
  const SortProductCard({
    super.key,
    required this.text,
    required this.value,
    required this.forSearchProduct,
  });

  final String text;
  final String value;
  final bool forSearchProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String sortProductPrice = forSearchProduct
        ? ref.watch(sortSearchProductPriceProvider)
        : ref.watch(sortProductPriceProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return Card(
      child: RadioListTile<String>(
        activeColor: isLightBrightness ? elevatedButtonColor : Colors.white,
        title: Text(text),
        value: value,
        groupValue: sortProductPrice,
        onChanged: (newValue) {
          if (forSearchProduct) {
            ref.read(sortSearchProductPriceProvider.notifier).state = newValue!;
          } else {
            ref.read(sortProductPriceProvider.notifier).state = newValue!;
          }
          Navigator.pop(context);
        },
      ),
    );
  }
}
