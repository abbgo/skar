import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenProperties(context).topSafeArea + 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShopSearchField(forShops: false),
        ],
      ),
    );
  }
}
