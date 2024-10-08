import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/models/theme.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

ScreenProperties screenProperties(BuildContext context) {
  ScreenProperties screenProperties = ScreenProperties(0, 0, 0);

  screenProperties.width = MediaQuery.of(context).size.width;
  screenProperties.height = MediaQuery.of(context).size.height;
  screenProperties.topSafeArea = MediaQuery.of(context).viewPadding.top;

  return screenProperties;
}

bool isLightTheme(BuildContext context, WidgetRef ref) {
  int theme = ref.watch(themeProvider);
  Brightness brightness = MediaQuery.of(context).platformBrightness;
  if (theme == ThemeType.system) {
    return brightness == Brightness.light;
  }
  if (theme == ThemeType.white) {
    return true;
  }
  return false;
}

Future<double> calculateMapWidthInKm(
  int zoomLevel,
  BuildContext context,
) async {
  if (zoomLevel >= 15) {
    return 1;
  }
  const earthCircumferenceKm = 40075.0;
  int totalPixels = 256 * (1 << zoomLevel);
  double metersPerPixel = earthCircumferenceKm * 1000 / totalPixels;
  double mapWidthInMeters = screenProperties(context).width * metersPerPixel;
  double mapWidthInKm = mapWidthInMeters / 1000;

  return mapWidthInKm;
}

Future<Position> getCurrentLocation() async {
  return await Geolocator.getCurrentPosition();
}

void permissionHandler(WidgetRef ref) async {
  var loadNotifier = ref.read(loadProvider.notifier);
  var locationPermissionNotifier =
      ref.read(locationPermissionProvider.notifier);

  bool hasPermission = await checkAndGetCurrentLocation(ref);
  loadNotifier.state = false;
  if (hasPermission) {
    locationPermissionNotifier.state = true;
  }
}

Future<bool> checkAndGetCurrentLocation(WidgetRef ref) async {
  bool hasPermission = await hasLocationPermission();

  if (hasPermission) {
    getCurrentLocation().then((value) async {
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 15,
      );

      await ref.read(cameraPositionProvider.notifier).change(cameraPosition);

      ShopParams shopParams =
          ShopParams(latitude: value.latitude, longitude: value.longitude);

      await ref
          .read(markersProvider.notifier)
          .setMarker(value.latitude, value.longitude);

      await ref.read(shopParamProvider.notifier).changeForMap(shopParams);
    });
  }
  return hasPermission;
}
