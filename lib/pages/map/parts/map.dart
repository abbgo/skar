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

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final Completer<GoogleMapController> _mapController = Completer();
  late CameraPosition _position;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        Set<Marker> markers = ref.watch(markersProvider);
        AsyncValue<ResultShop> shopsForMap =
            ref.watch(shopsForMapProvider(context));
        bool isHybridMap = ref.watch(isHybridMapProvider);
        CameraPosition cameraPosition = ref.watch(cameraPositionProvider);

        ref.listen(
          cameraPositionProvider,
          (previous, next) async {
            GoogleMapController controller = await _mapController.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(next));
          },
        );

        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            shopsForMap.when(
              skipError: true,
              skipLoadingOnReload: true,
              skipLoadingOnRefresh: true,
              data: (data) {
                return GoogleMap(
                  markers: markers,
                  initialCameraPosition: cameraPosition,
                  mapType: isHybridMap ? MapType.hybrid : MapType.normal,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    if (!_mapController.isCompleted) {
                      _mapController.complete(controller);
                    }
                  },
                  onCameraMove: (CameraPosition position) async {
                    _position = position;
                  },
                  onCameraIdle: () async {
                    double kilometer = await calculateMapWidthInKm(
                      _position.zoom.toInt(),
                      context,
                    );

                    ShopParams shopParams = ShopParams(
                      latitude: _position.target.latitude,
                      longitude: _position.target.longitude,
                      kilometer: kilometer.toInt(),
                    );
                    await ref
                        .read(shopParamProvider.notifier)
                        .changeForMap(shopParams);
                  },
                );
              },
              error: (error, stackTrace) => errorMethod(error),
              loading: () => Center(
                child: Consumer(
                  builder: (context, ref, child) {
                    bool isLightBrightness = isLightTheme(context, ref);
                    return Image.asset(
                      isLightBrightness
                          ? 'assets/animated_icons/animated_map.gif'
                          : 'assets/animated_icons/animated_map_dark.gif',
                    );
                  },
                ),
              ),
            ),
            const MapSearchAndMapTypeButton(),
            const LocationButton(),
            const ShopList(),
          ],
        );
      },
    );
  }
}
