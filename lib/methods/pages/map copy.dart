import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';

IconButton locationButtonMethod(BuildContext context, Function()? onPressed) {
  return IconButton(
    onPressed: onPressed,
    style: IconButton.styleFrom(
      backgroundColor: const Color(0xFFFE0002),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.zero),
      ),
    ),
    icon: const Icon(
      Icons.location_on_outlined,
      color: Colors.white,
    ),
  );
}

TextButton vipButtonMethod(BuildContext context) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      backgroundColor: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.zero),
      ),
    ),
    child: const Text(
      "VIP",
      style: TextStyle(color: Colors.black),
    ),
  );
}

ListView listviewMethod(BuildContext context, List<Shop> shops, bool isTM,
    ScrollController scrollController) {
  return ListView.builder(
    controller: scrollController,
    scrollDirection: Axis.horizontal,
    itemCount: shops.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
      child: Container(
        width: 230,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: listviewImageMethod(context, shops[index], isTM),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 8,
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: listviewNameColumnMethod(shops[index], isTM),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child:
                              listviewCallButtonMethod(context, shops[index]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Container listviewCallButtonMethod(BuildContext context, Shop shop) {
  return Container(
    alignment: Alignment.bottomCenter,
    child: IconButton(
      onPressed: () {
        FlutterPhoneDirectCaller.callNumber(shop.phones![0]);
      },
      icon: const Icon(
        Icons.call,
        color: Color(0xFF4AC76D),
        size: 20,
      ),
    ),
  );
}

Column listviewNameColumnMethod(Shop shop, bool isTM) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        isTM ? shop.nameTM : shop.nameRU,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        isTM ? shop.addressTM! : shop.addressRU!,
        style: const TextStyle(
          fontSize: 9,
        ),
      ),
    ],
  );
}

Container listviewImageMethod(BuildContext context, Shop shop, bool isTM) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BottomNavigationPage(shopID: shop.id, isMapPage: false),
            ),
          );
        },
        child: showCachImageMethod(shop.image!),
      ),
    ),
  );
}
