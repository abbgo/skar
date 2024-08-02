import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/price_range/price_range.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ListTile(
      title: Text(lang.priceRange),
      subtitle: Consumer(
        builder: (context, ref, child) {
          String priceRange = ref.watch(priceRangeProvider);
          return Text(priceRange);
        },
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
