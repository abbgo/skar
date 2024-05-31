import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/database/functions/favorite.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

final fetchFavoriteShopsProvider =
    FutureProvider.family<ResultShop, ShopParams>(
  (ref, params) async {
    ResultShop result = ResultShop.defaultResult();
    List<String> shopIDs = await getFavoriteShops(params.favoriteType!);
    try {
      List<Shop> shops = await ref
          .read(apiProvider)
          .fetchShopsByIDs(ids: shopIDs, page: params.page!);
      ref.read(hasFavoriteShopsProvider.notifier).state = shops.isNotEmpty;
      result = ResultShop(shops: shops, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);
