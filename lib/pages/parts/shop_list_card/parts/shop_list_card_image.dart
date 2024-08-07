import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/shop.dart';

class ShopListCardImage extends StatelessWidget {
  const ShopListCardImage({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
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
                  onTap: () =>
                      goToPage(context, ShopPage(shopID: shop.id!), false),
                  child: showCachImageMethod(shop.image!),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
