import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/internet_connection.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/map/parts/location_permission.dart' as permission;
import 'package:skar/pages/map/parts/map.dart' as map;

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasInternet = ref.watch(connectivityStatusProviders) ==
        ConnectivityStatus.isConnected;

    final Completer<GoogleMapController> googleMpCtrl = Completer();

    permissionHandler(googleMpCtrl, ref);

    bool isLoading = ref.watch(loadProvider);
    bool hasPermission = ref.watch(locationPermissionProvider);

    return hasInternet
        ? isLoading
            ? Center(
                child: Image.asset("assets/animated_icons/animated_map.gif"),
              )
            : hasPermission
                ? map.Map(mapController: googleMpCtrl)
                : permission.LocationPermission(mapController: googleMpCtrl)
        : const InternetError();
  }
}
