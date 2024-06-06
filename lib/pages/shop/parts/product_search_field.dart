import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';
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
                hintText: AppLocalizations.of(context)!.searchProduct,
                suffixIcon: IconButton(
                  icon: Icon(Icons.close, color: elevatedButtonColor, size: 24),
                  onPressed: () {
                    ref.read(openSearchBarProvider.notifier).state = false;
                    ref.read(shopProductSearchProvider.notifier).state = '';
                    ref.read(hasShopProductsProvider.notifier).state = true;
                  },
                ),
              ),
              onSubmitted: (value) async {
                ref.read(shopProductSearchProvider.notifier).state = value;
                ref.read(hasShopProductsProvider.notifier).state = true;
              },
            );
          },
        ),
      ),
    );
  }
}
