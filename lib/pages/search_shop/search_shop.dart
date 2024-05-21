import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/pages/search_shop/parts/search_shop_result.dart';
import 'package:skar/services/shop.dart';

class SearchShopPage extends StatefulWidget {
  const SearchShopPage({super.key});

  @override
  State<SearchShopPage> createState() => _SearchShopPageState();
}

class _SearchShopPageState extends State<SearchShopPage> {
  static ShopParams shopParams = const ShopParams(isBrend: false);

  changeSearch(String value) {
    print('------------------------------');
    setState(() {
      shopParams = ShopParams(isBrend: false, search: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.only(top: screenProperties(context).topSafeArea + 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: elevatedButtonColor),
                  ),
                  ShopSearchField(changeSearch: changeSearch),
                ],
              ),
              SearchShopResult(shopParams: shopParams),
            ],
          ),
        ),
      ),
    );
  }
}
