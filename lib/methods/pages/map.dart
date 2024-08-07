import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/marker_widget/marker_widget.dart';
import 'package:skar/pages/parts/select_shop_bottom_sheet/select_shop_bottom_sheet.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

Text listviewNameColumnMethod(Shop shop, bool isTM) {
  return Text(
    isTM ? shop.nameTM! : shop.nameRU!,
    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );
}

// Future<BitmapDescriptor> generateMarkerIconMethod(bool isTM, Shop shop) {
//   return Column(
//     children: [
//       Text(
//         isTM ? shop.nameTM! : shop.nameRU!,
//         style: const TextStyle(
//           fontSize: 24,
//           // color: Colors.white,
//           color: Colors.black,
//           // fontWeight: FontWeight.bold,
//           // shadows: [
//           //   Shadow(offset: Offset(-1.5, -1.5), color: Colors.red),
//           //   Shadow(offset: Offset(1.5, -1.5), color: Colors.red),
//           //   Shadow(offset: Offset(1.5, 1.5), color: Colors.red),
//           //   Shadow(offset: Offset(-1.5, 1.5), color: Colors.red),
//           // ],
//         ),
//       ),
//       Image.asset('assets/icons/shirt_location.png', height: 50),
//     ],
//   ).toBitmapDescriptor(
//     logicalSize: const Size(1000, 100),
//     imageSize: const Size(1000, 100),
//   );
// }

Future<BitmapDescriptor> generateMarkerIcon(
  bool isTM,
  Shop shop,
  bool forOnTap,
) {
  return MarkerWidget(shop: shop, isTM: isTM, forOnTap: forOnTap)
      .toBitmapDescriptor(
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
