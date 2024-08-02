import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/price_range/parts/min_and_max_inputs.dart';
import 'package:skar/pages/parts/price_range/parts/price_range_save_button.dart';
import 'package:skar/pages/parts/price_range/parts/radio_list_tile.dart';

class PriceRangePage extends StatelessWidget {
  PriceRangePage({super.key});

  final List<PriceRangeClass> priceRanges = [
    PriceRangeClass(name: '0 man - 100 man', range: '0-100'),
    PriceRangeClass(name: '100 man - 200 man', range: '100-200'),
    PriceRangeClass(name: '200 man - 500 man', range: '200-500'),
    PriceRangeClass(name: '500 man - 1000 man', range: '500-1000'),
    PriceRangeClass(name: '1000 man - 2000 man', range: '1000-2000'),
    PriceRangeClass(name: '2000 man - 10000 man', range: '2000-10000'),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.priceRange),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const MinAndMaxInputs(),
                ...priceRanges.map((e) => RadioListTileWidget(priceRange: e)),
              ],
            ),
          ),
          const PriceRangeSaveButton(),
        ],
      ),
    );
  }
}

class PriceRangeClass {
  final String name, range;

  PriceRangeClass({required this.name, required this.range});
}
