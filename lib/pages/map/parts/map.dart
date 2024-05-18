import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/map/parts/bottom_shops.dart';
import 'package:skar/pages/map/parts/search_bar.dart';
import 'package:skar/pages/map/parts/shop_list.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

class Map extends StatelessWidget {
  const Map({super.key, required this.mapController});
  final Completer<GoogleMapController> mapController;

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(37.898429, 58.354480), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        Set<Marker> markers = ref.watch(markersProvider);
        var shopsForMap = ref.watch(shopsForMapProvider(context));

        return shopsForMap.when(
          skipLoadingOnReload: true,
          data: (resultShopsForMap) {
            if (resultShopsForMap.error != '') {
              return const SomeThingWrong();
            }

            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                GoogleMap(
                  markers: markers,
                  initialCameraPosition: _kGooglePlex,
                  mapType: MapType.hybrid,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    if (!mapController.isCompleted) {
                      mapController.complete(controller);
                    }
                  },
                  onCameraMove: (CameraPosition position) async {
                    ShopParams shopParams = ShopParams(
                      latitude: position.target.latitude,
                      longitude: position.target.longitude,
                      kilometer: 1,
                    );
                    await ref
                        .read(shopParamProvider.notifier)
                        .change(shopParams);
                  },
                ),
                Positioned(
                  top: 50,
                  right: 25,
                  child: const MapSearchBar(),
                ),
                MapButtons(mapController: mapController),
                const ShopList(),
              ],
            );
          },
          error: (error, stackTrace) => errorMethod(error),
          loading: () => Center(
            child: Image.asset("assets/animated_icons/animated_map.gif"),
          ),
        );
      },
    );
  }
}
