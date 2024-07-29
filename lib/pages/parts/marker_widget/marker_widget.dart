import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/marker_widget/parts/shop_with_parent_marker.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({super.key, required this.shop, required this.isTM});

  final Shop shop;
  final bool isTM;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        shop.parentShop!.id == null || shop.parentShop!.id!.isEmpty
            ? Text(
                isTM ? shop.nameTM! : shop.nameRU!,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              )
            : ShopWithParentMarker(shop: shop, isTM: isTM),
        Image.asset('assets/icons/shirt_location.png', height: 50),
      ],
    );
  }
}
