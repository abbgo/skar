import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/map/parts/bottom_shops.dart';
import 'package:skar/pages/map/parts/search_button.dart';
import 'package:skar/pages/map/parts/shop_list.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

class Map extends ConsumerWidget {
  Map({super.key});

  final Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = screenProperties(context).isLightBrightness;
    Set<Marker> markers = ref.watch(markersProvider);
    AsyncValue<ResultShop> shopsForMap =
        ref.watch(shopsForMapProvider(context));
    bool isHybridMap = ref.watch(isHybridMapProvider);
    CameraPosition cameraPosition = ref.watch(cameraPositionProvider);

    ref.listen(
      cameraPositionProvider,
      (previous, next) async {
        GoogleMapController controller = await mapController.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(next));
      },
    );

    return shopsForMap.when(
      skipError: true,
      skipLoadingOnReload: true,
      data: (resultShopsForMap) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            GoogleMap(
              markers: markers,
              initialCameraPosition: cameraPosition,
              mapType: isHybridMap ? MapType.hybrid : MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                if (!mapController.isCompleted) {
                  mapController.complete(controller);
                }
              },
              onCameraMove: (CameraPosition position) async {
                double kilometer = await calculateMapWidthInKm(
                  position.zoom.toInt(),
                  context,
                );

                ShopParams shopParams = ShopParams(
                  latitude: position.target.latitude,
                  longitude: position.target.longitude,
                  kilometer: kilometer.toInt(),
                );
                await ref
                    .read(shopParamProvider.notifier)
                    .changeForMap(shopParams);
              },
            ),
            MapSearchAndMapTypeButton(mapController: mapController),
            LocationButton(mapController: mapController),
            const ShopList(),
          ],
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => Center(
        child: Image.asset(
          isLightBrightness
              ? 'assets/animated_icons/animated_map.gif'
              : 'assets/animated_icons/animated_map_dark.gif',
        ),
      ),
    );
  }
}
