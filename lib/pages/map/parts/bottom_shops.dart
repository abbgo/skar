import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/providers/pages/map.dart';

class MapButtons extends ConsumerWidget {
  const MapButtons({super.key, required this.mapController});

  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double bannerHeight = ref.watch(bannerHeightProvider);

    return AnimatedPositioned(
      bottom: bannerHeight == 0.4
          ? screenProperties(context).height * bannerHeight
          : screenProperties(context).height * 0.07,
      right: 5,
      duration: const Duration(milliseconds: 300),
      child: Row(
        children: [
          locationButtonMethod(
            context,
            () {
              var markersNotifier = ref.read(markersProvider.notifier);
              var loadNotifier = ref.read(loadProvider.notifier);
              var locationPermissionNotifier =
                  ref.read(locationPermissionProvider.notifier);
              permissionHandler(markersNotifier, loadNotifier,
                  locationPermissionNotifier, mapController);
            },
          ),
          vipButtonMethod(context),
        ],
      ),
    );
  }
}
