import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';

class ShopWithParentMarker extends StatelessWidget {
  const ShopWithParentMarker({
    super.key,
    required this.shop,
    required this.isTM,
  });

  final Shop shop;
  final bool isTM;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              isTM ? shop.nameTM! : shop.nameRU!,
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(height: 10),
            shop.parentShop!.id == null || shop.parentShop!.id!.isEmpty
                ? const SizedBox()
                : Text(
                    isTM ? shop.parentShop!.nameTM! : shop.parentShop!.nameRU!,
                    style: const TextStyle(fontSize: 24, color: Colors.green),
                  ),
            SizedBox(
              height:
                  shop.parentShop!.id == null || shop.parentShop!.id!.isEmpty
                      ? 0
                      : 10,
            ),
            Text(
              isTM ? shop.addressTM! : shop.addressRU!,
              style: const TextStyle(fontSize: 24, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
