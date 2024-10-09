import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/sort_and_filter_product/sort_and_filter_product.dart';
import 'package:skar/pages/shop/parts/product_search_field.dart';
import 'package:skar/pages/shop/parts/shipping_button.dart';
import 'package:skar/providers/pages/filter_genders.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopPageButtons extends ConsumerWidget {
  const ShopPageButtons({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool isLightBrightness = isLightTheme(context, ref);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor:
                        isLightBrightness ? null : scaffoldColorDarkTheme,
                  ),
                  onPressed: () {
                    ref.read(priceRangeProvider.notifier).state = '0-0';
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.adaptive.arrow_back),
                ),
                ShippingButton(
                  hasShipping: shop.hasShipping!,
                  isLightBrightness: isLightBrightness,
                ),
              ],
            ),
            const ProductSearchField()
          ],
        ),
        SizedBox(
          height: 35,
          child: Row(
            children: [
              SortAndFilterProduct(
                text: lang.sort,
                icon: Icons.swap_vert,
                forSort: true,
                forSearchProduct: false,
                provider: productGendersProvider,
              ),
              SortAndFilterProduct(
                text: lang.filter,
                icon: Icons.filter_alt_outlined,
                forSort: false,
                forSearchProduct: false,
                provider: productGendersProvider,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
