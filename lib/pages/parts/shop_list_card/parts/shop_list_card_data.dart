import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/call_button.dart';

class ShopListCardData extends StatelessWidget {
  const ShopListCardData({super.key, required this.isTM, required this.shop});

  final bool isTM;
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
        child: Container(
          constraints: const BoxConstraints(maxHeight: double.infinity),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Text(
                    isTM ? shop.nameTM! : shop.nameRU!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: CallButton(shop: shop),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
