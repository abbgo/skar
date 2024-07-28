import 'package:flutter/material.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/shop.dart';

class ShopListTileImage extends StatelessWidget {
  const ShopListTileImage(
      {super.key, required this.shop, required this.cardHeight});

  final Shop shop;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => goToPage(context, ShopPage(shopID: shop.id!), false),
        child: SizedBox(
          height: cardHeight,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: showCachImageMethod(shop.image!),
          ),
        ),
      ),
    );
  }
}
