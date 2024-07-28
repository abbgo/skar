import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/parts/shop_favorite_button.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class ShopListTileData extends StatelessWidget {
  const ShopListTileData(
      {super.key, required this.shop, required this.forFavorite});

  final Shop shop;
  final bool forFavorite;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () => goToPage(context, ShopPage(shopID: shop.id!), false),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer(
            builder: (context, ref, child) {
              bool isTM = ref.watch(langProvider) == 'tr';

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        isTM ? shop.nameTM! : shop.nameRU!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        isTM ? shop.addressTM! : shop.addressRU!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  ShopFavoriteButton(shopID: shop.id!),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
