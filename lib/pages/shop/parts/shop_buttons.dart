import 'package:flutter/material.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/models/shop.dart';

class ShopPageButtons extends StatelessWidget {
  const ShopPageButtons({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: null,
              icon: Image.asset("assets/icons/search.png", height: 25),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => showCallBottomSheet(context, shop.phones!),
              icon: const Icon(
                Icons.call,
                color: Colors.green,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.more_horiz, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
