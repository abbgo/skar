import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/pages/map/parts/bottom_shops.dart';
import 'package:skar/pages/map/parts/shop_list.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/pages/map.dart';

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
          data: (shops) {
            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                GoogleMap(
                  markers: markers,
                  initialCameraPosition: _kGooglePlex,
                  mapType: MapType.hybrid,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    mapController.complete(controller);
                  },
                ),
                MapButtons(mapController: mapController),
                const ShopList(),
              ],
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString(), textAlign: TextAlign.center),
          ),
          loading: () => Center(
            child: Image.asset("assets/animated_icons/animated_map.gif"),
          ),
        );
      },
    );
  }
}
