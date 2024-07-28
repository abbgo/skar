import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/shop_list_tile/parts/buttons.dart';
import 'package:skar/pages/parts/shop_list_tile/parts/shop_data.dart';
import 'package:skar/pages/parts/shop_list_tile/parts/shop_image.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({
    super.key,
    required this.shop,
    this.mapPageContext,
    required this.forFavorite,
  });

  final Shop shop;
  static const double cardHeight = 110.0;
  final BuildContext? mapPageContext;
  final bool forFavorite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Card(
        child: Row(
          children: [
            ShopListTileImage(shop: shop, cardHeight: cardHeight),
            ShopListTileData(shop: shop, forFavorite: forFavorite),
            mapPageContext != null
                ? ShopListTileMapButton(
                    shop: shop,
                    mapPageContext: mapPageContext!,
                    forFavorite: forFavorite,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
