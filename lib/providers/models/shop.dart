import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/providers/local_storadge/setting.dart';
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
      bool isTM = ref.read(isTmProvider);

      if (shops.isNotEmpty) {
        for (Shop shop in shops) {
          ref.read(markersProvider.notifier).addMarker(
                Marker(
                  markerId: MarkerId(shop.id),
                  position: LatLng(shop.latitude, shop.longitude),
                  onTap: () => goToPage(
                    arg,
                    BottomNavigationPage(shopID: shop.id, isMapPage: false),
                    false,
                  ),
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

      List<Shop> shops = await ref.read(apiProvider).fetchShops(
            page: shopParams.page!,
            isBrend: shopParams.isBrend!,
            search: search,
          );

      ref.read(hasShopsProvider.notifier).state = shops.isNotEmpty;

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
            isBrend: shopParams.isBrend!,
            search: '',
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
