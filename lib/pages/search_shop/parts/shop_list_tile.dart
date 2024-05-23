import 'package:flutter/material.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/shop/shop.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({super.key, required this.shop});

  final Shop shop;
  static const double cardHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 3,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () =>
                    goToPage(context, ShopPage(shopID: shop.id), false),
                child: SizedBox(
                  height: cardHeight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: showCachImageMethod(shop.image!),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () =>
                    goToPage(context, ShopPage(shopID: shop.id), false),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        shop.nameTM,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: elevatedButtonColor,
                        ),
                      ),
                      Text(
                        shop.addressTM!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.travel_explore, color: elevatedButtonColor),
            ),
          ],
        ),
      ),
    );
  }
}
