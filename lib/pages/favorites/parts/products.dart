import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/product.dart';
import 'package:skar/pages/favorites/parts/no_favorites.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/models/favorite.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteProducts extends ConsumerWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasFavoriteProducts = ref.watch(hasFavoriteProductsProvider);
    AsyncValue<ResultProduct> favoriteProducts =
        ref.watch(fetchFavoriteProductsProvider);

    return !hasFavoriteProducts
        ? NoFavorites(text: AppLocalizations.of(context)!.noFavoriteProducts)
        : favoriteProducts.when(
            data: (data) {
              if (data.error != '' || data.products == null) {
                return const SomeThingWrong();
              }
              if (data.products!.isEmpty) {
                return NoFavorites(
                    text: AppLocalizations.of(context)!.noFavoriteProducts);
              }
              var favorites = data.products!;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  Product product = favorites[index];
                  return Text(product.nameTM);
                },
              );
            },
            error: (error, stackTrace) => errorMethod(error),
            loading: () => loadWidget,
          );
  }
}
