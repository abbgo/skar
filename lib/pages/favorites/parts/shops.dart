import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/favorites/parts/no_favorites.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/search_shop/parts/shop_list_tile.dart';
import 'package:skar/providers/models/favorite.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteShops extends ConsumerWidget {
  const FavoriteShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasFavoriteShops = ref.watch(hasFavoriteShopsProvider);
    AsyncValue<ResultShop> favoriteShops =
        ref.watch(fetchFavoriteShopsProvider);

    return !hasFavoriteShops
        ? NoFavorites(text: AppLocalizations.of(context)!.noResult)
        : favoriteShops.when(
            data: (data) {
              if (data.error != '' || data.shops == null) {
                return const SomeThingWrong();
              }
              var favorites = data.shops!;
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  Shop shop = favorites[index];
                  return ShopListTile(
                    shop: shop,
                    mapPageContext: context,
                    forFavorite: true,
                  );
                },
              );
            },
            error: (error, stackTrace) => errorMethod(error),
            loading: () => loadWidget,
          );
  }
}
