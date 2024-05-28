import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/database/functions/favorite.dart';
import 'package:skar/models/favorite.dart';

final hasInFavoritesProvider =
    FutureProvider.autoDispose.family<bool, Favorite>(
  (ref, arg) async {
    return await hasInFavorites(arg.id, arg.type);
  },
);
