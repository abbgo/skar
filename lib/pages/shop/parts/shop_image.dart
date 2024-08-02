import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/parts/shop_favorite_button.dart';
import 'package:skar/styles/colors.dart';

class ShopImage extends ConsumerWidget {
  const ShopImage({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    return SliverAppBar(
      backgroundColor:
          isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      expandedHeight: screenProperties(context).height / 4,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          showCachImageMethod(shop.image!),
          Positioned(
            top: screenProperties(context).topSafeArea + 10,
            right: 60,
            child: ShopFavoriteButton(shopID: shop.id!),
          ),
          Positioned(
            top: screenProperties(context).topSafeArea,
            right: 10,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              onPressed: () => showCallBottomSheet(context, shop.phones!),
              icon: const Icon(Icons.call, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
