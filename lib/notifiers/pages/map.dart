import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  // Future<void> removeAllMarkers() async {
  //   var firstElement = state.toList().sublist(0, 1);
  //   state = firstElement.toSet();
  // }
}

// class HybridMapNotifier extends StateNotifier<bool> {
//   HybridMapNotifier() : super(false);

//   Future<void> change() async {
//     state = !state;
//   }
// }

class CameraPositionNotifier extends StateNotifier<CameraPosition> {
  CameraPositionNotifier()
      : super(
          const CameraPosition(target: LatLng(37.898429, 58.354480), zoom: 15),
        );

  Future<void> change(CameraPosition position) async {
    state = position;
  }
}
