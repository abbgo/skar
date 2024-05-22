import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/pages/search_shop/parts/search_shop_result.dart';
import 'package:skar/providers/params/shop_param.dart';

class SearchShopPage extends ConsumerWidget {
  const SearchShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          ref.read(shopSearchProvider.notifier).state = '';
          return;
        }
        // ref.read(shopSearchProvider.notifier).state = '';
      },
      child: Scaffold(
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
                      onPressed: () {
                        ref.read(shopSearchProvider.notifier).state = '';
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: elevatedButtonColor),
                    ),
                    ShopSearchField(),
                  ],
                ),
                const SearchShopResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
