import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/parts/price_range/parts/min_and_max_inputs.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';

class PriceRangePage extends ConsumerWidget {
  const PriceRangePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    String priceRange = ref.watch(priceRangeProvider);

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
                RadioListTile.adaptive(
                  value: '0 man - 100 man',
                  groupValue: priceRange,
                  onChanged: (value) =>
                      ref.read(priceRangeProvider.notifier).state = value!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
