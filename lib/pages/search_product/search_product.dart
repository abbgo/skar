import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/search_product/parts/search_product_result.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/providers/pages/search_product.dart';

class SearchProductPage extends ConsumerWidget {
  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController =
        ref.watch(searchProductScrollControllerProvider);
    bool openSearchProductNavigateToTopButton =
        ref.watch(openSearchProductNavigateToTopButtonProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: ShopSearchField(forShops: false),
        centerTitle: true,
      ),
      body: const SearchProductResult(),
      floatingActionButton: openSearchProductNavigateToTopButton
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
    );
  }
}
