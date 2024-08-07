import 'package:flutter/material.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/shop.dart';

class ShopListCardImage extends StatelessWidget {
  const ShopListCardImage({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () => goToPage(context, ShopPage(shopID: shop.id!), false),
          child: showCachImageMethod(shop.image!),
        ),
      ),
    );
  }
}
