import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/pages/search_shop/parts/search_shop_result.dart';

class SearchShopPage extends StatelessWidget {
  const SearchShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.only(top: screenProperties(context).topSafeArea + 5),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: elevatedButtonColor),
                ),
                ShopSearchField(),
              ],
            ),
            const SearchShopResult(),
          ],
        ),
      ),
    );
  }
}
