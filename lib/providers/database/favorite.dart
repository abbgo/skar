import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/database/functions/favorite.dart';
import 'package:skar/models/favorite.dart';

final hasInFavoritesProvider =
    FutureProvider.autoDispose.family<bool, Favorite>(
  (ref, favorite) async {
    return await hasInFavorites(favorite.id, favorite.type);
  },
);

final createFavoriteProvider = FutureProvider.family<void, Favorite>(
  (ref, favorite) async {
    await createFavorite(favorite);
    ref.invalidate(hasInFavoritesProvider(favorite));
  },
);

final removeFromFavoriteProvider = FutureProvider.family<void, Favorite>(
  (ref, favorite) async {
    await removeFromFavorites(favorite);
    ref.invalidate(hasInFavoritesProvider(favorite));
  },
);

final getFavoriteShopsProvider =
    FutureProvider.autoDispose.family<List<String>, int>(
  (ref, type) async {
    return await getFavoriteShops(type);
  },
);
