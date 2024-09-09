import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/notifiers/pages/map.dart';

final locationPermissionProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final loadProvider = StateProvider.autoDispose<bool>((ref) => true);
final turnsProvider = StateProvider.autoDispose<double>((ref) => 0.0);
final bannerHeightProvider = StateProvider.autoDispose<double>((ref) => 0.25);
final pageNumberProvider = StateProvider<int>((ref) => 1);

final markersProvider =
    StateNotifierProvider.autoDispose<MarkersNotifier, Set<Marker>>(
  (ref) => MarkersNotifier(),
);

final isHybridMapProvider = StateNotifierProvider<HybridMapNotifier, bool>(
  (ref) => HybridMapNotifier(),
);

final cameraPositionProvider =
    StateNotifierProvider<CameraPositionNotifier, CameraPosition>(
  (ref) => CameraPositionNotifier(),
);
