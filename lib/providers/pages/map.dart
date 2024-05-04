import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

final locationPermissionProvider = StateProvider<bool>((ref) => false);
final loadProvider = StateProvider<bool>((ref) => true);
final turnsProvider = StateProvider<double>((ref) => 0.0);
final bannerHeightProvider = StateProvider<double>((ref) => 0.4);
final pageNumberProvider = StateProvider<int>((ref) => 1);
final loadPaginationProvider = StateProvider<bool>((ref) => false);

class MarkersNotifier extends StateNotifier<Set<Marker>> {
  MarkersNotifier() : super({});

  void setMarker(Marker marker) async {
    state = {marker};
  }

  void addMarker(List<Shop> shops, BuildContext context, bool isTM) async {
    var markers = state;
    for (Shop shop in shops) {
      markers.add(
        Marker(
          markerId: MarkerId(shop.id),
          position: LatLng(shop.latitude, shop.longitude),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationPage(
                  shopID: shop.id,
                  isMapPage: false,
                ),
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
    state = markers;
  }
}

final markersProvider = StateNotifierProvider<MarkersNotifier, Set<Marker>>(
  (ref) => MarkersNotifier(),
);
