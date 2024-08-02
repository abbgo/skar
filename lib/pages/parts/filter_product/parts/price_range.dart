import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/price_range/price_range.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ListTile(
      title: Text(lang.priceRange),
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
