import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:markers_cluster_google_maps_flutter/markers_cluster_google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/map/parts/bottom_shops.dart';
import 'package:skar/pages/map/parts/map_buttons.dart';
import 'package:skar/pages/map/parts/shop_list.dart';
import 'package:skar/providers/api/shop.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

class Map extends ConsumerStatefulWidget {
  const Map({super.key});

  @override
  ConsumerState<Map> createState() => _MapState();
}

class _MapState extends ConsumerState<Map> {
  final Completer<GoogleMapController> _mapController = Completer();
  late CameraPosition _position;
  late MarkersClusterManager _clusterManager;
  double _currentZoom = 15;

  @override
  void initState() {
    super.initState();
    // Initialize the cluster manager with custom settings
    _clusterManager = MarkersClusterManager(
      clusterMarkerSize: 35.0,
      clusterColor: Colors.blue,
      clusterBorderThickness: 2.0,
      clusterBorderColor: Colors.blue[900]!,
      clusterOpacity: 1.0,
      clusterTextStyle: const TextStyle(fontSize: 15, color: Colors.white),
    );
  }

  // Update clusters based on the current zoom level
  Future<void> _updateClusters() async {
    await _clusterManager.updateClusters(zoomLevel: _currentZoom);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<ResultShop> shopsForMap =
        ref.watch(shopsForMapProvider(context));
    CameraPosition cameraPosition = ref.watch(cameraPositionProvider);

    ref.listen(
      cameraPositionProvider,
      (previous, next) async {
        GoogleMapController controller = await _mapController.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(next));
      },
    );

    ref.listen(
      markersProvider,
      (previous, next) {
        for (Marker marker in next.toList()) {
          _clusterManager.addMarker(marker);
        }
      },
    );

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        shopsForMap.when(
          skipError: true,
          skipLoadingOnReload: true,
          skipLoadingOnRefresh: true,
          data: (data) {
            return GoogleMap(
              trafficEnabled: false,
              buildingsEnabled: false,
              indoorViewEnabled: false,
              compassEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              liteModeEnabled: false,
              minMaxZoomPreference: const MinMaxZoomPreference(10, 20),
              markers: Set<Marker>.of(_clusterManager.getClusteredMarkers()),
              initialCameraPosition: cameraPosition,
              mapType: MapType.hybrid,
              onMapCreated: (GoogleMapController controller) async {
                if (!_mapController.isCompleted) {
                  _mapController.complete(controller);
                }

                await _updateClusters();
              },
              onCameraMove: (CameraPosition position) => _position = position,
              onCameraIdle: () async {
                _currentZoom = _position.zoom;

                double kilometer = await calculateMapWidthInKm(
                  _position.zoom.toInt(),
                  context,
                );

                await _updateClusters();

                ShopParams shopParams = ShopParams(
                  latitude: _position.target.latitude,
                  longitude: _position.target.longitude,
                  kilometer: kilometer.toInt(),
                );
                await ref
                    .read(shopParamProvider.notifier)
                    .changeForMap(shopParams);
              },
            );
          },
          error: (error, stackTrace) => errorMethod(error),
          loading: () => Center(
            child: Consumer(
              builder: (context, ref, child) {
                bool isLightBrightness = isLightTheme(context, ref);
                return Image.asset(
                  isLightBrightness
                      ? 'assets/animated_icons/animated_map.gif'
                      : 'assets/animated_icons/animated_map_dark.gif',
                );
              },
            ),
          ),
        ),
        MapButtons(mapController: _mapController),
        const LocationButton(),
        const ShopList(),
      ],
    );
  }
}
