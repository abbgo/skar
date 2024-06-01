import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/search_shop/parts/shop_list_tile.dart';
import 'package:skar/providers/models/favorite.dart';
import 'package:skar/providers/params/shop_param.dart';

class FavoriteShops extends ConsumerWidget {
  const FavoriteShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasFavoriteShops = ref.watch(hasFavoriteShopsProvider);

    return !hasFavoriteShops
        ? const NoResult()
        : ListView.builder(
            itemBuilder: (context, index) {
              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;

              AsyncValue<ResultShop> favoriteShops =
                  ref.watch(fetchFavoriteShopsProvider(page));

              return favoriteShops.when(
                skipError: true,
                data: (data) {
                  if (data.error != '' || data.shops == null) {
                    return null;
                  }

                  if (indexInPage >= data.shops!.length) {
                    return null;
                  }

                  Shop shop = data.shops![indexInPage];
                  return ShopListTile(
                    shop: shop,
                    mapPageContext: context,
                    forFavorite: true,
                  );
                },
                error: (error, stackTrace) => errorMethod(error),
                loading: () => loadWidget,
              );
            },
          );
    // : favoriteShops.when(
    //     data: (data) {
    //       if (data.error != '' || data.shops == null) {
    //         return const SomeThingWrong();
    //       }
    //       var favorites = data.shops!;
    //       return ListView.builder(
    //         itemCount: favorites.length,
    //         itemBuilder: (context, index) {
    //           Shop shop = favorites[index];
    //           return ShopListTile(
    //             shop: shop,
    //             mapPageContext: context,
    //             forFavorite: true,
    //           );
    //         },
    //       );
    //     },
    //     error: (error, stackTrace) => errorMethod(error),
    //     loading: () => loadWidget,
    //   );
  }
}
