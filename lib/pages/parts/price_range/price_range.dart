import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/price_range/parts/min_and_max_inputs.dart';
import 'package:skar/pages/parts/price_range/parts/radio_list_tile.dart';

class PriceRangePage extends StatelessWidget {
  const PriceRangePage({super.key});

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
                RadioListTileWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
