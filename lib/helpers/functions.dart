import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

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
  Completer<GoogleMapController> mapController,
  WidgetRef ref,
) async {
  var markersNotifier = ref.read(markersProvider.notifier);
  var loadNotifier = ref.read(loadProvider.notifier);
  var locationPermissionNotifier =
      ref.read(locationPermissionProvider.notifier);
  var shopParamsNotifier = ref.read(shopParamProvider.notifier);

  bool hasPermission = await checkAndGetCurrentLocation(
      mapController, markersNotifier, shopParamsNotifier);
  loadNotifier.state = false;
  if (hasPermission) {
    locationPermissionNotifier.state = true;
  }
}

Future<bool> checkAndGetCurrentLocation(
  Completer<GoogleMapController> mapController,
  MarkersNotifier markersNotifier,
  ShopParamsNotifier shopParamsNotifier,
) async {
  bool hasPermission = await hasLocationPermission();

  if (hasPermission) {
    getCurrentLocation().then((value) async {
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 15,
      );

      ShopParams shopParams = ShopParams(
          latitude: value.latitude, longitude: value.longitude, kilometer: 1);

      GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      await markersNotifier.setMarker(value.latitude, value.longitude);
      await shopParamsNotifier.change(shopParams);
    });
  }
  return hasPermission;
}
