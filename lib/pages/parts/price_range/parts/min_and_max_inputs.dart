import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/parts/price_range/parts/min_max_input.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MinAndMaxInputs extends StatelessWidget {
  const MinAndMaxInputs({
    super.key,
    required this.minPriceCtrl,
    required this.maxPriceCtrl,
    required this.forSearchProduct,
  });

  final TextEditingController minPriceCtrl;
  final TextEditingController maxPriceCtrl;
  final bool forSearchProduct;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
      child: Consumer(
        builder: (context, ref, child) {
          String priceRange = forSearchProduct
              ? ref.watch(searchProductPriceRangeProvider)
              : ref.watch(priceRangeProvider);
          List<String> prices = priceRange.split('-');
          minPriceCtrl.text = prices[0];
          maxPriceCtrl.text = prices[1];

          return Row(
            children: [
              MinMaxInput(
                controller: minPriceCtrl,
                labelText: lang.theLowestPrice,
              ),
              const SizedBox(width: 20),
              MinMaxInput(
                controller: maxPriceCtrl,
                labelText: lang.theHighestPrice,
              ),
            ],
          );
        },
      ),
    );
  }
}
