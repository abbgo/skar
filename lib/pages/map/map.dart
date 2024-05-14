import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/map/parts/location_permission.dart' as permission;
import 'package:skar/pages/map/parts/map.dart' as map;

class MapPage extends ConsumerWidget {
  MapPage({super.key});
  final Completer<GoogleMapController> _googleMpCtrl = Completer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var markersNotifier = ref.read(markersProvider.notifier);
    var loadNotifier = ref.read(loadProvider.notifier);
    var locationPermissionNotifier =
        ref.read(locationPermissionProvider.notifier);
    permissionHandler(markersNotifier, loadNotifier, locationPermissionNotifier,
        _googleMpCtrl);

    bool isLoading = ref.watch(loadProvider);
    bool hasPermission = ref.watch(locationPermissionProvider);

    return Scaffold(
      body: isLoading
          ? Center(
              child: Image.asset("assets/animated_icons/animated_map.gif"),
            )
          : hasPermission
              ? map.Map(mapController: _googleMpCtrl)
              : permission.LocationPermission(mapController: _googleMpCtrl),
    );
  }
}
