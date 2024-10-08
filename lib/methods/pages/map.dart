import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/marker_widget/marker_widget.dart';
import 'package:skar/pages/parts/select_shop_bottom_sheet/select_shop_bottom_sheet.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

Future<BitmapDescriptor> generateMarkerIcon(
  bool isTM,
  Shop shop,
  bool forOnTap,
) {
  return MarkerWidget(
    shop: shop,
    isTM: isTM,
    forOnTap: forOnTap,
  ).toBitmapDescriptor(
    logicalSize: Size(1000, forOnTap ? 200 : 100),
    imageSize: Size(1000, forOnTap ? 200 : 100),
  );
}

showSelectShopBottomSheet(BuildContext context, Shop shop) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SelectShopBottomSheet(shop: shop),
  );
}
