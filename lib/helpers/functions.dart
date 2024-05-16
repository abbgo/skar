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
  MarkersNotifier markersNotifier,
  StateController<bool> loadNotifier,
  StateController<bool> locationPermissionNotifier,
  Completer<GoogleMapController> mapController,
) async {
  bool hasPermission =
      await checkAndGetCurrentLocation(mapController, markersNotifier);
  loadNotifier.state = false;
  if (hasPermission) {
    locationPermissionNotifier.state = true;
  }
}

Future<bool> checkAndGetCurrentLocation(
  Completer<GoogleMapController> mapController,
  MarkersNotifier markersNotifier,
) async {
  bool hasPermission = await hasLocationPermission();

  if (hasPermission) {
    getCurrentLocation().then((value) async {
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 15);

      GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      await markersNotifier.setMarker(value.latitude, value.longitude);
    });
  }
  return hasPermission;
}
