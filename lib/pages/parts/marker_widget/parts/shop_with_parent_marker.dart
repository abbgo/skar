import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';

class ShopWithParentMarker extends StatelessWidget {
  const ShopWithParentMarker(
      {super.key, required this.shop, required this.isTM});

  final Shop shop;
  final bool isTM;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Text(
            isTM ? shop.parentShop!.nameTM! : shop.parentShop!.nameRU!,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
          Text(
            isTM ? shop.nameTM! : shop.nameRU!,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
