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
      bottom: bannerHeight == 0.25
          ? screenProperties(context).height * bannerHeight
          : screenProperties(context).height * 0.06,
      right: 5,
      duration: const Duration(milliseconds: 300),
      child: Row(
        children: [
          locationButtonMethod(
            context,
            () {
              permissionHandler(ref);
            },
          ),
          // vipButtonMethod(context),
        ],
      ),
    );
  }
}
