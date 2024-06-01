import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/database/functions/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/params/shop_param.dart';

final fetchFavoriteShopsProvider = FutureProvider<ResultShop>(
  (ref) async {
    ResultShop result = ResultShop.defaultResult();
    List<String> shopIDs = await getFavoriteShops(FavoriteType.shop);
    try {
      List<Shop> shops =
          await ref.read(apiProvider).fetchShopsByIDs(ids: shopIDs);
      ref.read(hasFavoriteShopsProvider.notifier).state = shops.isNotEmpty;
      result = ResultShop(shops: shops, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);
