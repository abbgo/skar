import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/providers/database/favorite.dart';
import 'package:skar/providers/api/favorite.dart';
import 'package:skar/styles/colors.dart';

class ProductPageFavoriteButton extends ConsumerWidget {
  const ProductPageFavoriteButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    Favorite favorite = Favorite(id: productID, type: FavoriteType.product);
    AsyncValue<bool> hasInFavorites =
        ref.watch(hasInFavoritesProvider(favorite));

    return hasInFavorites.when(
      data: (data) {
        return IconButton(
          style: IconButton.styleFrom(
            backgroundColor: isLightBrightness ? null : scaffoldColorDarkTheme,
          ),
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
            color: data
                ? Colors.red
                : isLightBrightness
                    ? Colors.black
                    : Colors.white,
          ),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
