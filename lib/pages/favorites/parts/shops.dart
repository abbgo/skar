import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/providers/database/favorite.dart';

class FavoriteShops extends ConsumerWidget {
  const FavoriteShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<String>> favoriteShops =
        ref.watch(getFavoriteShopsProvider(FavoriteType.shop));

    return favoriteShops.when(
      data: (favorites) {
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            String favorite = favorites[index];
            return Text(favorite);
          },
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
