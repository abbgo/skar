import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/select_shop_bottom_sheet/parts/select_shop_bottom_sheet_card.dart';

class SelectShopBottomSheet extends StatelessWidget {
  const SelectShopBottomSheet({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          SelectShopBottomSheetCard(shop: shop),
          SelectShopBottomSheetCard(shop: shop.parentShop!),
        ],
      ),
    );
  }
}
