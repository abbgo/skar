import 'package:flutter/material.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: ShopSearchField(forShops: false),
      ),
    );
  }
}
