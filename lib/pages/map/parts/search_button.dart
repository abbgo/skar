import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/search_shop/search_shop.dart';
import 'package:skar/providers/pages/map.dart';

class MapSearchAndMapTypeButton extends StatelessWidget {
  const MapSearchAndMapTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenProperties(context).topSafeArea + 5,
      right: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () => goToPage(context, const SearchShopPage(), false),
            icon: Icon(Icons.search, color: elevatedButtonColor, size: 22),
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () =>
                    ref.read(isHybridMapProvider.notifier).change(),
                icon: Icon(Icons.layers, color: elevatedButtonColor, size: 22),
              );
            },
          ),
        ],
      ),
    );
  }
}
