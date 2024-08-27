import 'package:flutter/material.dart';
import 'package:skar/pages/parts/sort_product/sort_product_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SortProduct extends StatelessWidget {
  const SortProduct({super.key, required this.forSearchProduct});

  final bool forSearchProduct;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          SortProductCard(
            text: lang.defaultSort,
            value: '',
            forSearchProduct: forSearchProduct,
          ),
          SortProductCard(
            text: lang.lowestPrice,
            value: '0-1',
            forSearchProduct: forSearchProduct,
          ),
          SortProductCard(
            text: lang.highestPrice,
            value: '1-0',
            forSearchProduct: forSearchProduct,
          ),
        ],
      ),
    );
  }
}
