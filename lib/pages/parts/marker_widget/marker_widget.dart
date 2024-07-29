import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';

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
            : Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Text(
                      isTM
                          ? shop.parentShop!.nameTM!
                          : shop.parentShop!.nameRU!,
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    Text(
                      isTM ? shop.nameTM! : shop.nameRU!,
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
        Image.asset('assets/icons/shirt_location.png', height: 50),
      ],
    );
  }
}
