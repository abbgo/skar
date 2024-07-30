import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/marker_widget/marker_widget.dart';
import 'package:skar/pages/parts/select_shop_bottom_sheet.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

Text listviewNameColumnMethod(Shop shop, bool isTM) {
  return Text(
    isTM ? shop.nameTM! : shop.nameRU!,
    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );
}

Container listviewImageMethod(BuildContext context, Shop shop, bool isTM) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 30,
          offset: const Offset(0, 4),
        )
      ],
    ),
    width: double.infinity,
    height: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Consumer(
        builder: (context, ref, child) {
          return GestureDetector(
            onTap: () => goToPage(context, ShopPage(shopID: shop.id!), false),
            child: showCachImageMethod(shop.image!),
          );
        },
      ),
    ),
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
