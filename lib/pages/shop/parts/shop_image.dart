import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/parts/image.dart';

class ShopImage extends StatelessWidget {
  const ShopImage({super.key, required this.shopImage});

  final String shopImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: screenProperties(context).height / 4,
      automaticallyImplyLeading: false,
      flexibleSpace: showCachImageMethod(shopImage),
    );
  }
}
