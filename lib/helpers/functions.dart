import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/providers/pages/map.dart';

ScreenProperties screenProperties(BuildContext context) {
  ScreenProperties screenProperties = ScreenProperties(0, 0);

  screenProperties.width = MediaQuery.of(context).size.width;
  screenProperties.height = MediaQuery.of(context).size.height;

  return screenProperties;
}

Future<Position> getCurrentLocation() async {
  return await Geolocator.getCurrentPosition();
}

void permissionHandler(
  WidgetRef ref,
  Completer<GoogleMapController> mapController,
) async {
  bool hasPermission = await checkAndGetCurrentLocation(mapController, ref);
  ref.read(loadProvider.notifier).state = false;
  if (hasPermission) {
    ref.read(locationPermissionProvider.notifier).state = true;
  }
}

Future<bool> checkAndGetCurrentLocation(
  Completer<GoogleMapController> mapController,
  WidgetRef ref,
) async {
  bool hasPermission = await hasLocationPermission();

  if (hasPermission) {
    getCurrentLocation().then((value) async {
      await null;

      ref.read(markersProvider.notifier).setMarker(
            Marker(
              markerId: const MarkerId('1'),
              position: LatLng(value.latitude, value.longitude),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );

      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 15);

      GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }
  return hasPermission;
}
