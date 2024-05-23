import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
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
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: ShopSearchField(),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: screenProperties(context).topSafeArea + 5),
          child: const SearchShopResult(),
        ),
      ),
    );
  }
}
