import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/providers/database/favorite.dart';
import 'package:skar/providers/models/favorite.dart';

class ProductPageFavoriteButton extends ConsumerWidget {
  const ProductPageFavoriteButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Favorite favorite = Favorite(id: productID, type: FavoriteType.product);
    AsyncValue<bool> hasInFavorites =
        ref.watch(hasInFavoritesProvider(favorite));

    return hasInFavorites.when(
      data: (data) {
        return IconButton(
          onPressed: () async {
            if (data) {
              await ref.read(removeFromFavoriteProvider(favorite).future);
              ref.invalidate(fetchFavoriteProductsProvider);
              return;
            }
            await ref.read(createFavoriteProvider(favorite).future);
            ref.invalidate(fetchFavoriteProductsProvider);
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
