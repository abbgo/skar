import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/database/functions/favorite.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/providers/database/favorite.dart';

class ProductFavoriteButton extends ConsumerWidget {
  const ProductFavoriteButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Favorite favorite =
                  Favorite(id: productID, type: FavoriteType.product);
              if (data) {
                await removeFromFavorites(favorite);
                ref.invalidate(hasInFavoritesProvider(favorite));
                return;
              }
              await createFavorite(favorite);
              ref.invalidate(hasInFavoritesProvider(favorite));
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Icon(
                  data ? Icons.favorite : Icons.favorite_border,
                  color: data ? Colors.red : Colors.black,
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
