import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/models/product.dart';
import 'package:skar/pages/favorites/parts/no_favorites.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/parts/product_card/product_card.dart';
import 'package:skar/pages/product/product.dart';
import 'package:skar/providers/api/favorite.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteProducts extends ConsumerWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool hasFavoriteProducts = ref.watch(hasFavoriteProductsProvider);
    AsyncValue<ResultProduct> favoriteProducts =
        ref.watch(fetchFavoriteProductsProvider);

    return !hasFavoriteProducts
        ? NoFavorites(text: lang.noFavoriteProducts)
        : favoriteProducts.when(
            data: (data) {
              if (data.error != '' || data.products == null) {
                return const SomeThingWrong();
              }
              if (data.products!.isEmpty) {
                return NoFavorites(text: lang.noFavoriteProducts);
              }

              var favorites = data.products!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 310,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  Product product = favorites[index];
                  return Padding(
                    padding: index % 2 == 0
                        ? const EdgeInsets.only(left: 5)
                        : const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () => goToPage(
                          context, ProductPage(productID: product.id), false),
                      child: ProductCard(
                        product: product,
                        forSimilarProducts: false,
                        forFavorites: true,
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) => errorMethod(error),
            loading: () => loadWidget,
          );
  }
}
