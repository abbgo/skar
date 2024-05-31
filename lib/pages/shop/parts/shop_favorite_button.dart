import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/providers/database/favorite.dart';

class ShopFavoriteButton extends ConsumerWidget {
  const ShopFavoriteButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Favorite favorite = Favorite(id: shopID, type: FavoriteType.shop);

    AsyncValue<bool> hasInFavorites =
        ref.watch(hasInFavoritesProvider(favorite));

    return hasInFavorites.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (data) {
        return IconButton(
          onPressed: () async {
            Favorite favorite = Favorite(id: shopID, type: FavoriteType.shop);
            if (data) {
              await ref.read(removeFromFavoriteProvider(favorite).future);
              return;
            }
            await ref.read(createFavoriteProvider(favorite).future);
          },
          icon: Icon(
            data ? Icons.favorite : Icons.favorite_border,
            color: data ? Colors.red : Colors.black,
          ),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
