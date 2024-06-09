import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/search_shop/search_shop.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/styles/colors.dart';

class MapSearchAndMapTypeButton extends ConsumerWidget {
  const MapSearchAndMapTypeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return Positioned(
      top: screenProperties(context).topSafeArea + 5,
      right: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => goToPage(
              context,
              SearchShopPage(mapPageContext: context),
              false,
            ),
            icon: Icon(
              Icons.search,
              color: isLightBrightness ? elevatedButtonColor : Colors.white,
              size: 22,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () =>
                    ref.read(isHybridMapProvider.notifier).change(),
                icon: Icon(
                  Icons.layers,
                  color: isLightBrightness ? elevatedButtonColor : Colors.white,
                  size: 22,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
