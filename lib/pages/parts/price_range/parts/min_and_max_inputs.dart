import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/parts/input.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MinAndMaxInputs extends StatefulWidget {
  const MinAndMaxInputs({super.key});

  @override
  State<MinAndMaxInputs> createState() => _MinAndMaxInputsState();
}

class _MinAndMaxInputsState extends State<MinAndMaxInputs> {
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

    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
      child: Consumer(
        builder: (context, ref, child) {
          minPriceCtrl.text = '${ref.watch(minPriceProvider)} man';
          maxPriceCtrl.text = '${ref.watch(maxPriceProvider)} man';

          return Row(
            children: [
              Expanded(
                child: TextField(
                  controller: minPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: inputBorder(context, ref),
                    labelText: ' ${lang.theLowestPrice} ',
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: maxPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: inputBorder(context, ref),
                    labelText: ' ${lang.theHighestPrice} ',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
