import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/search_shop/search_shop.dart';

class MapSearchButton extends StatelessWidget {
  const MapSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenProperties(context).topSafeArea + 5,
      right: 10,
      child: IconButton(
        style: IconButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () => goToPage(context, const SearchShopPage(), false),
        icon: Icon(Icons.search, color: elevatedButtonColor, size: 22),
      ),
    );
  }
}
