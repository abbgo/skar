import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/services/shop.dart';
import 'package:widget_marker_google_map/widget_marker_google_map.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

final apiProvider = Provider<ShopService>((ref) => ShopService());
// final shopDataProvider = FutureProvider<List<Shop>>((ref) {
//   return ref.read(apiProvider).fetchShopsForMap('shops/map');
// });

final shopDataProvider = FutureProvider.family<List<Shop>, BuildContext>(
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
              icon: await Column(
                children: [
                  Text(
                    isTM ? shop.nameTM : shop.nameRU,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(offset: Offset(-1.5, -1.5), color: Colors.red),
                        Shadow(offset: Offset(1.5, -1.5), color: Colors.red),
                        Shadow(offset: Offset(1.5, 1.5), color: Colors.red),
                        Shadow(offset: Offset(-1.5, 1.5), color: Colors.red),
                      ],
                    ),
                  ),
                  Image.asset('assets/icons/shirt_location.png', height: 50),
                ],
              ).toBitmapDescriptor(
                logicalSize: const Size(1000, 100),
                imageSize: const Size(1000, 100),
              ),
            ),
          );
    }

    return shops;
  },
);
