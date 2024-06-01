import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/shop_list_tile/parts/shop_image.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/map.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({
    super.key,
    required this.shop,
    required this.mapPageContext,
    required this.forFavorite,
  });

  final Shop shop;
  static const double cardHeight = 100.0;
  final BuildContext mapPageContext;
  final bool forFavorite;

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
            ShopListTileImage(shop: shop, cardHeight: cardHeight),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () =>
                    goToPage(context, ShopPage(shopID: shop.id), false),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Consumer(
                    builder: (context, ref, child) {
                      bool isTM = ref.watch(isTmProvider);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isTM ? shop.nameTM : shop.nameRU,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: elevatedButtonColor,
                            ),
                          ),
                          Text(
                            isTM ? shop.addressTM! : shop.addressRU!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      );
                    },
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
                              mapPageContext,
                              ShopPage(shopID: shop.id),
                              false,
                            ),
                            icon: await generateMarkerIconMethod(isTM, shop),
                          ),
                        );

                    CameraPosition cameraPosition = CameraPosition(
                      target: LatLng(shop.latitude, shop.longitude),
                      zoom: 20,
                    );
                    ref.read(cameraPositionProvider.notifier).state =
                        cameraPosition;

                    if (forFavorite) {
                      ref.read(selectedBottomIndexProvider.notifier).state = 0;
                      return;
                    }

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
