import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/search_shop/search_shop.dart';
import 'package:skar/styles/colors.dart';

class SearchShopButton extends ConsumerWidget {
  const SearchShopButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      onPressed: () => Navigator.push(
        context,
        CustomPageRoute(
          child: SearchShopPage(mapPageContext: context),
          direction: AxisDirection.left,
        ),
      ),
      icon: Icon(
        Icons.search,
        color: isLightBrightness ? elevatedButtonColor : Colors.white,
        size: 22,
      ),
    );
  }
}
