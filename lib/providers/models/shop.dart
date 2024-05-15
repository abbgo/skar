import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/services/shop.dart';

final apiProvider = Provider<ShopService>((ref) => ShopService());

final shopsForMapProvider =
    FutureProvider.autoDispose.family<ResultShop, BuildContext>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      List<Shop> shops =
          await ref.read(apiProvider).fetchShopsForMap('shops/map');
      bool isTM = ref.read(isTmProvider);

      for (Shop shop in shops) {
        ref.read(markersProvider.notifier).addMarker(
              Marker(
                markerId: MarkerId(shop.id),
                position: LatLng(shop.latitude, shop.longitude),
                onTap: () {
                  Navigator.push(
                    arg,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationPage(
                        shopID: shop.id,
                        isMapPage: false,
                      ),
                    ),
                  );
                },
                icon: await generateMarkerIconMethod(isTM, shop),
              ),
            );
      }
      result = ResultShop(shops: shops, error: '');
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);

var fetchShopsProvider =
    FutureProvider.family<ResultShop, int>((ref, page) async {
  ResultShop result = ResultShop.defaultResult();

  try {
    List<Shop> shops = await ref.read(apiProvider).fetchShops(page: page);
    result = ResultShop(shops: shops, error: '');
  } catch (e) {
    result = ResultShop(error: e.toString());
  }

  return result;
});

var fetchShopProvider = FutureProvider.autoDispose.family<Shop, String>(
  (ref, shopID) => ref.read(apiProvider).fetchShop(shopID),
);
