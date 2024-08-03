import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/filter_product/parts/filter_product_save_button.dart';
import 'package:skar/pages/parts/filter_product/parts/price_range.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({super.key, required this.forSearchProduct});

  final bool forSearchProduct;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: Text(lang.filter),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Column(
              children: [
                PriceRange(),
              ],
            ),
          ),
          FilterProductSaveButton(),
        ],
      ),
    );
  }
}
