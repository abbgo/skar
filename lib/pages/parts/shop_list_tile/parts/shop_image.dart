import 'package:flutter/material.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/child_shops/child_shops.dart';
import 'package:skar/pages/parts/brand_icon.dart';
import 'package:skar/pages/shop/shop.dart';

class ShopListTileImage extends StatelessWidget {
  const ShopListTileImage({
    super.key,
    required this.shop,
    required this.cardHeight,
    required this.cardWidth,
  });

  final Shop shop;
  final double cardHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => shop.isShoppingCenter!
          ? goToPage(context, ChildShopsPage(parentShopID: shop.id!), false)
          : goToPage(context, ShopPage(shopID: shop.id!), false),
      child: Stack(
        children: [
          SizedBox(
            height: cardHeight,
            width: cardWidth,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: showCachImageMethod(shop.image!),
            ),
          ),
          BrandIcon(isBrand: shop.isBrand!, top: 2, left: 2, size: 25),
        ],
      ),
    );
  }
}
