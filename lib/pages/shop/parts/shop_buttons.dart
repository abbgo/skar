import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/parts/product_search_field.dart';
import 'package:skar/pages/shop/parts/shop_favorite_button.dart';
import 'package:skar/providers/pages/shop.dart';
import 'package:skar/styles/colors.dart';

class ShopPageButtons extends ConsumerWidget {
  const ShopPageButtons({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool openSearchBar = ref.watch(openSearchBarProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: isLightBrightness ? null : scaffoldColorDarkTheme,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.adaptive.arrow_back),
        ),
        openSearchBar
            ? const ProductSearchField()
            : Row(
                children: [
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
                      color: isLightBrightness ? null : Colors.white,
                    ),
                  ),
                  ShopFavoriteButton(shopID: shop.id),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor:
                          isLightBrightness ? null : scaffoldColorDarkTheme,
                    ),
                    onPressed: () => showCallBottomSheet(context, shop.phones!),
                    icon: const Icon(Icons.call, color: Colors.green),
                  ),
                ],
              ),
      ],
    );
  }
}
