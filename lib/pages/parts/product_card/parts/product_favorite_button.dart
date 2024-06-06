import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/providers/database/favorite.dart';
import 'package:skar/providers/models/favorite.dart';
import 'package:skar/styles/colors.dart';

class ProductFavoriteButton extends ConsumerWidget {
  const ProductFavoriteButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = screenProperties(context).isLightBrightness;
    Favorite favorite = Favorite(id: productID, type: FavoriteType.product);
    AsyncValue<bool> hasInFavorites =
        ref.watch(hasInFavoritesProvider(favorite));

    return Positioned(
      right: 5,
      top: 5,
      child: hasInFavorites.when(
        data: (data) {
          return GestureDetector(
            onTap: () async {
              if (data) {
                await ref.read(removeFromFavoriteProvider(favorite).future);
                ref.invalidate(fetchFavoriteProductsProvider);
                return;
              }
              await ref.read(createFavoriteProvider(favorite).future);
              ref.invalidate(fetchFavoriteProductsProvider);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: isLightBrightness
                        ? Colors.grey.withOpacity(0.5)
                        : Colors.white.withOpacity(.5),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor:
                    isLightBrightness ? Colors.white : dialogColorDarkTheme,
                radius: 15,
                child: Icon(
                  data ? Icons.favorite : Icons.favorite_border,
                  color: data
                      ? Colors.red
                      : isLightBrightness
                          ? Colors.black
                          : Colors.white,
                  size: 16,
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) => errorMethod(error),
        loading: () => loadWidget,
      ),
    );
  }
}
