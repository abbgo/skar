import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  // VARIABLES ----------------------------------------------------
  final Completer<GoogleMapController> _googleMpCtrl = Completer();
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(37.898429, 58.354480), zoom: 15);

  // FUNCTIONS ----------------------------------------------------
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      permissionHandler(ref, _googleMpCtrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    bool isLoading = ref.watch(loadProvider);
    bool hasPermission = ref.watch(locationPermissionProvider);
    var markers = ref.watch(markersProvider);
    var shopsForMap = ref.watch(shopDataProvider);
    bool isTM = ref.watch(isTmProvider);

    return Scaffold(
      body: isLoading
          ? Center(
              child: Image.asset("assets/animated_icons/animated_map.gif"),
            )
          : hasPermission
              ? shopsForMap.when(
                  data: (shops) {
                    ref
                        .read(markersProvider.notifier)
                        .addMarker(shops, context, isTM);

                    return GoogleMap(
                      markers: markers,
                      initialCameraPosition: _kGooglePlex,
                      mapType: MapType.normal,
                      myLocationButtonEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _googleMpCtrl.complete(controller);
                      },
                    );
                  },
                  error: (error, stackTrace) => Center(
                      child:
                          Text(error.toString(), textAlign: TextAlign.center)),
                  loading: () => Center(
                    child:
                        Image.asset("assets/animated_icons/animated_map.gif"),
                  ),
                )
              : locationPermissionMethod(context, markers, _googleMpCtrl),
    );
  }
}
