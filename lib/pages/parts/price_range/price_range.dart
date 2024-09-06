import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/price_range/parts/min_and_max_inputs.dart';
import 'package:skar/pages/parts/price_range/parts/price_range_save_button.dart';
import 'package:skar/pages/parts/price_range/parts/radio_list_tile.dart';

class PriceRangePage extends StatefulWidget {
  const PriceRangePage({super.key, required this.forSearchProduct});

  final bool forSearchProduct;

  @override
  State<PriceRangePage> createState() => _PriceRangePageState();
}

class _PriceRangePageState extends State<PriceRangePage> {
  final List<PriceRangeClass> priceRanges = [
    PriceRangeClass(name: '0 TMT - 100 TMT', range: '0-100'),
    PriceRangeClass(name: '100 TMT - 200 TMT', range: '100-200'),
    PriceRangeClass(name: '200 TMT - 500 TMT', range: '200-500'),
    PriceRangeClass(name: '500 TMT - 1000 TMT', range: '500-1000'),
    PriceRangeClass(name: '1000 TMT - 2000 TMT', range: '1000-2000'),
    PriceRangeClass(name: '2000 TMT - 10000 TMT', range: '2000-10000'),
  ];

  final TextEditingController minPriceCtrl = TextEditingController();
  final TextEditingController maxPriceCtrl = TextEditingController();

  @override
  void dispose() {
    minPriceCtrl.dispose();
    maxPriceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.productPrice),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                MinAndMaxInputs(
                  minPriceCtrl: minPriceCtrl,
                  maxPriceCtrl: maxPriceCtrl,
                  forSearchProduct: widget.forSearchProduct,
                ),
                ...priceRanges.map((e) => RadioListTileWidget(
                      priceRange: e,
                      forSearchProduct: widget.forSearchProduct,
                    )),
              ],
            ),
          ),
          PriceRangeSaveButton(
            minPriceCtrl: minPriceCtrl,
            maxPriceCtrl: maxPriceCtrl,
            forSearchProduct: widget.forSearchProduct,
          ),
        ],
      ),
    );
  }
}

class PriceRangeClass {
  final String name, range;

  PriceRangeClass({required this.name, required this.range});
}
