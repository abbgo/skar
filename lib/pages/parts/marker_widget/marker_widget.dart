import 'package:flutter/material.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/marker_widget/parts/shop_with_parent_marker.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({
    super.key,
    required this.shop,
    required this.isTM,
    required this.forOnTap,
    // required this.isHybrid,
  });

  final Shop shop;
  final bool isTM;
  final bool forOnTap;
  // final bool isHybrid;

  @override
  Widget build(BuildContext context) {
    Widget iconTopWidget = const SizedBox();

    if (forOnTap) {
      iconTopWidget = ShopWithParentMarker(shop: shop, isTM: isTM);
    } else {
      iconTopWidget = Text(
        isTM ? shop.nameTM! : shop.nameRU!,
        style: const TextStyle(
          fontSize: 24,
          shadows: [
            Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
            Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
            Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
            Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
          ],
          // color: isHybrid ? Colors.white : Colors.black,
          // shadows: isHybrid
          //     ? const [
          //         Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
          //         Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
          //         Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
          //         Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
          //       ]
          //     : [],
        ),
      );
    }

    return Column(
      children: [
        iconTopWidget,
        Image.asset('assets/icons/shirt_location.png', height: 50),
      ],
    );
  }
}
