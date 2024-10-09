import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/map/parts/decrease_zoom_button.dart';
import 'package:skar/pages/map/parts/increase_zoom_button.dart';
import 'package:skar/pages/map/parts/search_shop_button.dart';
import 'package:skar/pages/map/parts/shop_filter_button.dart';

class MapButtons extends ConsumerWidget {
  const MapButtons({super.key, required this.mapController});

  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: screenProperties(context).topSafeArea + 5,
      right: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SearchShopButton(),
          const ShopFilterButton(),
          SizedBox(height: screenProperties(context).height / 2 - 200),
          IncreaseZoomButton(mapController: mapController),
          DecreaseZoomButton(mapController: mapController),
        ],
      ),
    );
  }
}
