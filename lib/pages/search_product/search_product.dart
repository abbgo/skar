import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/parts/sort_and_filter_product/sort_and_filter_product.dart';
import 'package:skar/pages/search_product/parts/search_product_result.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/providers/pages/filter_genders.dart';
import 'package:skar/providers/pages/search_product.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchProductPage extends ConsumerWidget {
  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    ScrollController scrollController =
        ref.watch(searchProductScrollControllerProvider);
    bool openSearchProductNavigateToTopButton =
        ref.watch(openSearchProductNavigateToTopButtonProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: SearchField(
          onPressed: () {
            ref.read(productSearchProvider.notifier).state = '';
            ref.read(hasProductsProvider.notifier).state = true;
          },
          onSubmitted: (value) {
            ref.read(productSearchProvider.notifier).state = value;
            ref.read(hasProductsProvider.notifier).state = true;
          },
          hintText: lang.searchProduct,
          initText: ref.watch(productSearchProvider),
          ref: ref,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 35,
            child: Row(
              children: [
                SortAndFilterProduct(
                  text: lang.sort,
                  icon: Icons.swap_vert,
                  forSort: true,
                  forSearchProduct: true,
                  provider: productSearchGendersProvider,
                ),
                SortAndFilterProduct(
                  text: lang.filter,
                  icon: Icons.filter_alt_outlined,
                  forSort: false,
                  forSearchProduct: true,
                  provider: productSearchGendersProvider,
                ),
              ],
            ),
          ),
          const SearchProductResult(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
