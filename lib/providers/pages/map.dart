import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final locationPermissionProvider = StateProvider<bool>((ref) => false);
final loadProvider = StateProvider<bool>((ref) => true);
final turnsProvider = StateProvider<double>((ref) => 0.0);
final bannerHeightProvider = StateProvider<double>((ref) => 0.4);
final pageNumberProvider = StateProvider<int>((ref) => 1);

class MarkersNotifier extends StateNotifier<Set<Marker>> {
  MarkersNotifier() : super({});

  Future<void> setMarker(double latitude, double longitude) async {
    var marker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarker,
    );

    state = {...state, marker};
  }

  void addMarker(Marker marker) {
    state = {...state, marker};
  }
}

final markersProvider = StateNotifierProvider<MarkersNotifier, Set<Marker>>(
  (ref) => MarkersNotifier(),
);
