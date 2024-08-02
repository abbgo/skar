import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/sort_and_filter_product/sort_and_filter_product.dart';
import 'package:skar/pages/shop/parts/product_search_field.dart';
import 'package:skar/pages/shop/parts/shipping_button.dart';
import 'package:skar/providers/pages/shop.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopPageButtons extends ConsumerWidget {
  const ShopPageButtons({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    bool openSearchBar = ref.watch(openSearchBarProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return Row(
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
                Navigator.pop(context);
              },
              icon: Icon(Icons.adaptive.arrow_back),
            ),
            openSearchBar
                ? const SizedBox()
                : ShippingButton(
                    hasShipping: shop.hasShipping!,
                    isLightBrightness: isLightBrightness,
                  )
          ],
        ),
        openSearchBar
            ? const ProductSearchField()
            : Row(
                children: [
                  SortAndFilterProduct(
                    text: lang.sort,
                    icon: Icons.swap_vert,
                    forSort: true,
                  ),
                  SortAndFilterProduct(
                    text: lang.filter,
                    icon: Icons.filter_alt_outlined,
                    forSort: false,
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor:
                          isLightBrightness ? null : scaffoldColorDarkTheme,
                    ),
                    onPressed: () =>
                        ref.read(openSearchBarProvider.notifier).state = true,
                    icon: Image.asset(
                      "assets/icons/search.png",
                      height: 25,
                      color: isLightBrightness
                          ? elevatedButtonColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
