import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final locationPermissionProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final loadProvider = StateProvider.autoDispose<bool>((ref) => true);
final turnsProvider = StateProvider.autoDispose<double>((ref) => 0.0);
final bannerHeightProvider = StateProvider.autoDispose<double>((ref) => 0.4);
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

  Future<void> addMarker(Marker marker) async {
    List<MarkerId> markerIDs = state.map((e) => e.markerId).toList();
    if (!markerIDs.contains(marker.markerId)) {
      state = {...state, marker};
    }
  }

  Future<void> removeAllMarkers() async {
    var firstElement = state.toList().sublist(0, 1);
    state = firstElement.toSet();
  }
}

final markersProvider =
    StateNotifierProvider.autoDispose<MarkersNotifier, Set<Marker>>(
  (ref) => MarkersNotifier(),
);

class HybridMapNotifier extends StateNotifier<bool> {
  HybridMapNotifier() : super(false);

  void change() {
    state = !state;
  }
}

final isHybridMapProvider = StateNotifierProvider<HybridMapNotifier, bool>(
  (ref) => HybridMapNotifier(),
);
