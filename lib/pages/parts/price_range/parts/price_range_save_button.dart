import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';

class PriceRangeSaveButton extends StatelessWidget {
  const PriceRangeSaveButton(
      {super.key, required this.minPriceCtrl, required this.maxPriceCtrl});

  final TextEditingController minPriceCtrl;
  final TextEditingController maxPriceCtrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: screenProperties(context).width,
        child: Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                ref.read(priceRangeProvider.notifier).state =
                    '${minPriceCtrl.text}-${maxPriceCtrl.text}';
                Navigator.pop(context);
              },
              child: Text(lang.select),
            );
          },
        ),
      ),
    );
  }
}
