import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/api/product.dart';
import 'package:skar/providers/params/product_param.dart';

class FilterProductSaveButton extends ConsumerWidget {
  const FilterProductSaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      width: screenProperties(context).width,
      child: ElevatedButton(
        onPressed: () {
          ref.read(hasProductsProvider.notifier).state = true;
          ref.invalidate(fetchProductsProvider);
          Navigator.pop(context);
        },
        child: Text(lang.select),
      ),
    );
  }
}
