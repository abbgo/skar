import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/child_shops/child_shops.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/map.dart';

class ShopListTileMapButton extends ConsumerWidget {
  const ShopListTileMapButton({
    super.key,
    required this.shop,
    required this.mapPageContext,
    required this.forFavorite,
  });

  final Shop shop;
  final BuildContext mapPageContext;
  final bool forFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(langProvider) == 'tr';
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      onPressed: () async {
        await ref.read(markersProvider.notifier).removeAllMarkers();
        await ref.read(markersProvider.notifier).addMarker(
              Marker(
                markerId: MarkerId('${shop.latitude}-${shop.longitude}'),
                position: LatLng(shop.latitude!, shop.longitude!),
                onTap: () => shop.isShoppingCenter!
                    ? goToPage(
                        mapPageContext,
                        ChildShopsPage(parentShopID: shop.id!),
                        false,
                      )
                    : shop.parentShop!.id == null ||
                            shop.parentShop!.id!.isEmpty
                        ? goToPage(
                            mapPageContext,
                            ShopPage(shopID: shop.id!),
                            false,
                          )
                        : showSelectShopBottomSheet(mapPageContext, shop),
                icon: await generateMarkerIcon(isTM, shop, true),
              ),
            );

        CameraPosition cameraPosition = CameraPosition(
          target: LatLng(shop.latitude!, shop.longitude!),
          zoom: 20,
        );
        await ref.read(cameraPositionProvider.notifier).change(cameraPosition);

        if (forFavorite) {
          ref.read(selectedBottomIndexProvider.notifier).state = 0;
          return;
        }

        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      icon: Icon(
        Icons.travel_explore,
        color: isLightBrightness ? elevatedButtonColor : Colors.white,
      ),
    );
  }
}
