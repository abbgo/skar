import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/database/functions/favorite.dart';
import 'package:skar/models/favorite_type.dart';
import 'package:skar/models/product.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/providers/api/product.dart';
import 'package:skar/providers/api/shop.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:skar/providers/params/shop_param.dart';

final fetchFavoriteShopsProvider = FutureProvider<ResultShop>(
  (ref) async {
    ResultShop result = ResultShop.defaultResult();
    List<String> shopIDs = await getFavorites(FavoriteType.shop);
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

final fetchFavoriteProductsProvider = FutureProvider<ResultProduct>(
  (ref) async {
    ResultProduct result = ResultProduct.defaultResult();
    List<String> productIDs = await getFavorites(FavoriteType.product);
    try {
      List<Product> products = await ref
          .read(productApiProvider)
          .fetchProductsByIDs(ids: productIDs);
      ref.read(hasFavoriteProductsProvider.notifier).state =
          products.isNotEmpty;
      result = ResultProduct(products: products, error: '');
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }
    return result;
  },
);
