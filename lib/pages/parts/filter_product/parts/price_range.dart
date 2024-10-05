import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/price_range/price_range.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';

class PriceRange extends ConsumerWidget {
  const PriceRange({super.key, required this.forSearchProduct});

  final bool forSearchProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    String priceRange = forSearchProduct
        ? ref.watch(searchProductPriceRangeProvider)
        : ref.watch(priceRangeProvider);

    return ListTile(
      title: Text(
        lang.productPrice,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: priceRange == '0-0' ? null : Text(priceRange),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          priceRange == '0-0'
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () => forSearchProduct
                      ? ref
                          .read(searchProductPriceRangeProvider.notifier)
                          .state = '0-0'
                      : ref.read(priceRangeProvider.notifier).state = '0-0',
                  icon: const Icon(Icons.clear),
                ),
          Icon(Icons.adaptive.arrow_forward),
        ],
      ),
      onTap: () => Navigator.push(
        context,
        CustomPageRoute(
          child: PriceRangePage(forSearchProduct: forSearchProduct),
          direction: AxisDirection.left,
        ),
      ),
    );
  }
}
