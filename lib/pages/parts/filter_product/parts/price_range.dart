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
        lang.priceRange,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: priceRange == '0-0'
          ? null
          : Row(
              children: [
                Text(priceRange),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => forSearchProduct
                      ? ref
                          .read(searchProductPriceRangeProvider.notifier)
                          .state = '0-0'
                      : ref.read(priceRangeProvider.notifier).state = '0-0',
                  child: const Icon(Icons.cancel_outlined),
                ),
              ],
            ),
      trailing: Icon(Icons.adaptive.arrow_forward),
      onTap: () => Navigator.push(
        context,
        CustomPageRoute(
          child: const PriceRangePage(),
          direction: AxisDirection.left,
        ),
      ),
    );
  }
}
