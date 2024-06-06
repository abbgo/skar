import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/styles/colors.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

Container listviewCallButtonMethod(BuildContext context, Shop shop) {
  bool isLightBrightness = screenProperties(context).isLightBrightness;

  return Container(
    alignment: Alignment.topCenter,
    child: IconButton(
      style: IconButton.styleFrom(
        backgroundColor: isLightBrightness ? null : scaffoldColorDarkTheme,
      ),
      onPressed: () => showCallBottomSheet(context, shop.phones!),
      icon: const Icon(Icons.call, color: Color(0xFF4AC76D), size: 20),
    ),
  );
}

Text listviewNameColumnMethod(Shop shop, bool isTM) {
  return Text(
    isTM ? shop.nameTM : shop.nameRU,
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
            onTap: () => goToPage(context, ShopPage(shopID: shop.id), false),
            child: showCachImageMethod(shop.image!),
          );
        },
      ),
    ),
  );
}

Future<BitmapDescriptor> generateMarkerIconMethod(bool isTM, Shop shop) {
  return Column(
    children: [
      Text(
        isTM ? shop.nameTM : shop.nameRU,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(offset: Offset(-1.5, -1.5), color: Colors.red),
            Shadow(offset: Offset(1.5, -1.5), color: Colors.red),
            Shadow(offset: Offset(1.5, 1.5), color: Colors.red),
            Shadow(offset: Offset(-1.5, 1.5), color: Colors.red),
          ],
        ),
      ),
      Image.asset('assets/icons/shirt_location.png', height: 50),
    ],
  ).toBitmapDescriptor(
    logicalSize: const Size(1000, 100),
    imageSize: const Size(1000, 100),
  );
}
