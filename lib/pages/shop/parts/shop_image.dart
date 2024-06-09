import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/styles/colors.dart';

class ShopImage extends ConsumerWidget {
  const ShopImage({super.key, required this.shopImage});

  final String shopImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    return SliverAppBar(
      backgroundColor:
          isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      expandedHeight: screenProperties(context).height / 4,
      automaticallyImplyLeading: false,
      flexibleSpace: showCachImageMethod(shopImage),
    );
  }
}
