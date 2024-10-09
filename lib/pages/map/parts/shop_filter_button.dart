import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class ShopFilterButton extends ConsumerWidget {
  const ShopFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      // onPressed: () => Navigator.push(
      //   context,
      //   CustomPageRoute(
      //     child: SearchShopPage(mapPageContext: context),
      //     direction: AxisDirection.left,
      //   ),
      // ),
      onPressed: () {},
      icon: Icon(
        Icons.filter_alt_outlined,
        color: isLightBrightness ? elevatedButtonColor : Colors.white,
        size: 22,
      ),
    );
  }
}
