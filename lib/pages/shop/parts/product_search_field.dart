import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/pages/shop.dart';
import 'package:skar/providers/params/product_param.dart';

class ProductSearchField extends StatelessWidget {
  const ProductSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: SizedBox(
        height: 40,
        width: screenProperties(context).width - 100,
        child: Consumer(
          builder: (context, ref, child) {
            return TextField(
              autofocus: true,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: elevatedButtonColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0, left: 20),
                hintText: AppLocalizations.of(context)!.searchProduct,
                filled: true,
                fillColor: Colors.white,
                enabledBorder: outlinedInputBorder(),
                focusedBorder: outlinedInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close, color: elevatedButtonColor, size: 24),
                  onPressed: () {
                    ref.read(openSearchBarProvider.notifier).state = false;
                    ref.read(productSearchProvider.notifier).state = '';
                    ref.read(hasProductsProvider.notifier).state = true;
                  },
                ),
              ),
              onSubmitted: (value) async {
                ref.read(productSearchProvider.notifier).state = value;
                ref.read(hasProductsProvider.notifier).state = true;
              },
            );
          },
        ),
      ),
    );
  }
}
