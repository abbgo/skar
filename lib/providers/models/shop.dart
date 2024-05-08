import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/services/shop.dart';

final shopPageProvider = StateProvider<int>((ref) => 1);
final shopDataProvider = StateProvider<List<Shop>>((ref) => <Shop>[]);

final apiProvider = Provider<ShopService>((ref) => ShopService());
// final shopDataProvider = FutureProvider<List<Shop>>((ref) {
//   return ref.read(apiProvider).fetchShopsForMap('shops/map');
// });

final shopsProvider =
    FutureProvider.family<List<Shop>, ShopParam>((ref, arg) async {
  var page = ref.watch(shopPageProvider);

  var shops = await ref
      .read(apiProvider)
      .fetchShops(arg.api, arg.limit, page, arg.isBrend);
  ref.read(shopDataProvider.notifier).state.addAll(shops);

  return shops;
});

final shopsForMapProvider = FutureProvider.family<List<Shop>, BuildContext>(
  (ref, arg) async {
    var shops = await ref.read(apiProvider).fetchShopsForMap('shops/map');
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
                    builder: (context) =>
                        BottomNavigationPage(shopID: shop.id, isMapPage: false),
                  ),
                );
              },
              icon: await generateMarkerIconMethod(isTM, shop),
            ),
          );
    }

    return shops;
  },
);
