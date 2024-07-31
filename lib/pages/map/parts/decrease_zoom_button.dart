import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class DecreaseZoomButton extends ConsumerWidget {
  const DecreaseZoomButton({super.key, required this.mapController});

  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return GestureDetector(
      onTap: () async {
        GoogleMapController controller = await mapController.future;
        controller.animateCamera(CameraUpdate.zoomOut());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black, width: .1)),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Icon(
          Icons.remove,
          color: isLightBrightness ? elevatedButtonColor : Colors.white,
        ),
      ),
    );
  }
}
