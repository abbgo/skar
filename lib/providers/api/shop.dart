import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/child_shops/child_shops.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/child_shops.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

final apiProvider = Provider<ShopService>((ref) => ShopService());

final shopsForMapProvider =
    FutureProvider.autoDispose.family<ResultShop, BuildContext>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      var shopParams = ref.watch(shopParamProvider);
      List<Shop> shops =
          await ref.read(apiProvider).fetchShopsForMap('shops/map', shopParams);
      bool isTM = ref.read(langProvider) == 'tr';

      if (shops.isNotEmpty) {
        for (Shop shop in shops) {
          await ref.read(markersProvider.notifier).addMarker(
                Marker(
                  markerId: MarkerId(shop.id),
                  position: LatLng(shop.latitude!, shop.longitude!),
                  onTap: () => shop.isShoppingCenter!
                      ? goToPage(
                          arg,
                          ChildShopsPage(parentShopID: shop.id),
                          false,
                        )
                      : goToPage(arg, ShopPage(shopID: shop.id), false),
                  icon: await generateMarkerIconMethod(isTM, shop),
                ),
              );
        }
      }
      result = ResultShop(shops: shops, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);

var fetchShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, shopParams) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      String search = ref.watch(shopSearchProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      List<Shop> shops = await ref.read(apiProvider).fetchShops(
            page: shopParams.page!,
            isRandom: shopParams.isRandom!,
            search: search,
            lang: isTM ? 'tm' : 'ru',
          );

      ref.read(hasShopsProvider.notifier).state = shops.isNotEmpty;

      result = ResultShop(shops: shops, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);

var fetchChildShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, shopParams) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      String search = ref.watch(childShopsSearchProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      List<Shop> shops = await ref.read(apiProvider).fetchShops(
            page: shopParams.page!,
            isRandom: shopParams.isRandom!,
            search: search,
            lang: isTM ? 'tm' : 'ru',
          );

      ref.read(hasChildShopsProvider.notifier).state = shops.isNotEmpty;

      result = ResultShop(shops: shops, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);

var fetchBrendShopsProvider = FutureProvider.family<ResultShop, ShopParams>(
  (ref, shopParams) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      List<Shop> shops = await ref.read(apiProvider).fetchShops(
            page: shopParams.page!,
            isRandom: shopParams.isRandom!,
            search: '',
            lang: '',
          );
      result = ResultShop(shops: shops, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);

var fetchShopProvider = FutureProvider.autoDispose.family<ResultShop, String>(
  (ref, shopID) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      Shop shop = await ref.read(apiProvider).fetchShop(shopID);
      result = ResultShop(shop: shop, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);
