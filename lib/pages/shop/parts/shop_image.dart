import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/styles/colors.dart';

class ShopImage extends StatelessWidget {
  const ShopImage({super.key, required this.shopImage});

  final String shopImage;

  @override
  Widget build(BuildContext context) {
    bool isLightBrightness = screenProperties(context).isLightBrightness;
    return SliverAppBar(
      backgroundColor:
          isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      expandedHeight: screenProperties(context).height / 4,
      automaticallyImplyLeading: false,
      flexibleSpace: showCachImageMethod(shopImage),
    );
  }
}
