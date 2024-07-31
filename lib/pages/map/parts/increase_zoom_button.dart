import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class IncreaseZoomButton extends ConsumerWidget {
  const IncreaseZoomButton({super.key, required this.mapController});

  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return GestureDetector(
      onTap: () async {
        GoogleMapController controller = await mapController.future;
        controller.animateCamera(CameraUpdate.zoomIn());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black, width: .1)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Icon(
          Icons.add,
          color: isLightBrightness ? elevatedButtonColor : Colors.white,
        ),
      ),
    );
  }
}
