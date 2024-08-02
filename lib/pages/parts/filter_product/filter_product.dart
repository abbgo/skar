import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/filter_product/parts/filter_product_save_button.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: Text(lang.filter),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListTile(
              title: Text(lang.priceRange),
              trailing: Icon(Icons.adaptive.arrow_forward),
            ),
          ),
          const SaveButton(),
        ],
      ),
    );
  }
}
