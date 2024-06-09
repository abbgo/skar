import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/providers/database/favorite.dart';
import 'package:skar/providers/models/favorite.dart';
import 'package:skar/styles/colors.dart';

class ShopFavoriteButton extends ConsumerWidget {
  const ShopFavoriteButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    Favorite favorite = Favorite(id: shopID, type: FavoriteType.shop);
    AsyncValue<bool> hasInFavorites =
        ref.watch(hasInFavoritesProvider(favorite));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: hasInFavorites.when(
        skipError: true,
        skipLoadingOnRefresh: true,
        skipLoadingOnReload: true,
        data: (data) {
          return GestureDetector(
            onTap: () async {
              if (data) {
                await ref.read(removeFromFavoriteProvider(favorite).future);
                ref.invalidate(fetchFavoriteShopsProvider);
                return;
              }
              await ref.read(createFavoriteProvider(favorite).future);
              ref.invalidate(fetchFavoriteShopsProvider);
            },
            child: Icon(
              data ? Icons.favorite : Icons.favorite_border,
              color: data
                  ? Colors.red
                  : isLightBrightness
                      ? elevatedButtonColor
                      : Colors.white,
            ),
          );
        },
        error: (error, stackTrace) => errorMethod(error),
        loading: () => loadWidget,
      ),
    );
  }
}
