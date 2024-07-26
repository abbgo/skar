import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/parts/appbar_leading_back_button.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/pages/search_shop/parts/search_shop_result.dart';
import 'package:skar/providers/pages/search_shop.dart';
import 'package:skar/providers/params/shop_param.dart';

class SearchShopPage extends ConsumerWidget {
  const SearchShopPage({super.key, required this.mapPageContext});

  final BuildContext mapPageContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool openSearchShopNavigateToTopButton =
        ref.watch(openSearchShopNavigateToTopButtonProvider);
    ScrollController scrollController =
        ref.watch(searchShopScrollControllerProvider);
    bool isLightBrightness = isLightTheme(context, ref);

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
          title: const ShopSearchField(forShops: true),
        ),
        body: SearchShopResult(mapPageContext: mapPageContext),
        floatingActionButton: openSearchShopNavigateToTopButton
            ? FloatingActionButton(
                onPressed: () async {
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: Icon(
                  Icons.arrow_upward,
                  color: isLightBrightness ? Colors.white : Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
