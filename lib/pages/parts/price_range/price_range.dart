import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/price_range/parts/min_and_max_inputs.dart';
import 'package:skar/pages/parts/price_range/parts/price_range_save_button.dart';
import 'package:skar/pages/parts/price_range/parts/radio_list_tile.dart';

class PriceRangePage extends StatefulWidget {
  const PriceRangePage({super.key});

  @override
  State<PriceRangePage> createState() => _PriceRangePageState();
}

class _PriceRangePageState extends State<PriceRangePage> {
  final List<PriceRangeClass> priceRanges = [
    PriceRangeClass(name: '0 man - 100 man', range: '0-100'),
    PriceRangeClass(name: '100 man - 200 man', range: '100-200'),
    PriceRangeClass(name: '200 man - 500 man', range: '200-500'),
    PriceRangeClass(name: '500 man - 1000 man', range: '500-1000'),
    PriceRangeClass(name: '1000 man - 2000 man', range: '1000-2000'),
    PriceRangeClass(name: '2000 man - 10000 man', range: '2000-10000'),
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
        title: Text(lang.priceRange),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                MinAndMaxInputs(
                  minPriceCtrl: minPriceCtrl,
                  maxPriceCtrl: maxPriceCtrl,
                ),
                ...priceRanges.map((e) => RadioListTileWidget(priceRange: e)),
              ],
            ),
          ),
          PriceRangeSaveButton(
            minPriceCtrl: minPriceCtrl,
            maxPriceCtrl: maxPriceCtrl,
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
