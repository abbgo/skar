import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/map.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile(
      {super.key, required this.shop, required this.mapController});

  final Shop shop;
  static const double cardHeight = 100.0;
  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 3,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () =>
                    goToPage(context, ShopPage(shopID: shop.id), false),
                child: SizedBox(
                  height: cardHeight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: showCachImageMethod(shop.image!),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () =>
                    goToPage(context, ShopPage(shopID: shop.id), false),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        shop.nameTM,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: elevatedButtonColor,
                        ),
                      ),
                      Text(
                        shop.addressTM!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                bool isTM = ref.watch(isTmProvider);

                return IconButton(
                  onPressed: () async {
                    await ref.read(markersProvider.notifier).removeAllMarkers();
                    await ref.read(markersProvider.notifier).addMarker(
                          Marker(
                            markerId: MarkerId(shop.id),
                            position: LatLng(shop.latitude, shop.longitude),
                            onTap: () => goToPage(
                              context,
                              BottomNavigationPage(
                                  shopID: shop.id, isMapPage: false),
                              false,
                            ),
                            icon: await generateMarkerIconMethod(isTM, shop),
                          ),
                        );

                    CameraPosition cameraPosition = CameraPosition(
                      target: LatLng(shop.latitude, shop.longitude),
                      zoom: 20,
                    );

                    GoogleMapController controller = await mapController.future;
                    await controller.animateCamera(
                      CameraUpdate.newCameraPosition(cameraPosition),
                    );

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(Icons.travel_explore, color: elevatedButtonColor),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
