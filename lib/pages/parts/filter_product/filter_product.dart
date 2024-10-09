import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/notifiers/pages/filter_genders.dart';
import 'package:skar/pages/parts/filter_product/parts/filter_categories_button.dart';
import 'package:skar/pages/parts/filter_product/parts/filter_gender_button.dart';
import 'package:skar/pages/parts/filter_product/parts/filter_product_save_button.dart';
import 'package:skar/pages/parts/filter_product/parts/price_range.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct(
      {super.key, required this.forSearchProduct, required this.provider});

  final bool forSearchProduct;
  final StateNotifierProvider<SelectedProductGendersNotifier, List<dynamic>>
      provider;

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
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                PriceRange(forSearchProduct: forSearchProduct),
                forSearchProduct
                    ? const FilterCategoriesButton()
                    : const SizedBox(),
                FilterGenderButton(provider: provider),
              ],
            ),
          ),
          const FilterProductSaveButton(),
        ],
      ),
    );
  }
}
