import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/providers/database/favorite.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/models/favorite.dart';

class ShopListTileData extends StatelessWidget {
  const ShopListTileData({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () => goToPage(context, ShopPage(shopID: shop.id), false),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer(
            builder: (context, ref, child) {
              bool isTM = ref.watch(isTmProvider);

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
                        isTM ? shop.nameTM : shop.nameRU,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: elevatedButtonColor,
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
                  GestureDetector(
                    onTap: () async {
                      Favorite favorite =
                          Favorite(id: shop.id, type: FavoriteType.shop);
                      await ref
                          .read(removeFromFavoriteProvider(favorite).future);
                      ref.invalidate(fetchFavoriteShopsProvider);
                    },
                    child: const Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
