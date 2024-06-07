import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/parts/appbar_leading_back_button.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/pages/search_shop/parts/search_shop_result.dart';
import 'package:skar/providers/params/shop_param.dart';

class SearchShopPage extends ConsumerWidget {
  const SearchShopPage({super.key, required this.mapPageContext});

  final BuildContext mapPageContext;

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
        appBar: AppBar(
          leading: const AppBarLeadingBackButton(),
          elevation: 0,
          scrolledUnderElevation: 0,
          title: ShopSearchField(forShops: true),
        ),
        body: SearchShopResult(mapPageContext: mapPageContext),
      ),
    );
  }
}
