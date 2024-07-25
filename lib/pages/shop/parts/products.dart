import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/product_card/product_card.dart';
import 'package:skar/pages/product/product.dart';
import 'package:skar/providers/api/category.dart';
import 'package:skar/providers/api/product.dart';
import 'package:skar/services/product.dart';

class ShopProducts extends ConsumerWidget {
  const ShopProducts({super.key, required this.shopID});
  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenProperties screenSize = screenProperties(context);
    var shopCategories = ref.watch(shopCategoriesProvider);

    return shopCategories.isNotEmpty
        ? SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 8,
              mainAxisExtent: screenSize.height * 0.35,
            ),
            itemBuilder: (context, index) {
              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;

              ProductParams params = ProductParams(
                api: 'products',
                limit: 10,
                page: page,
                categories: shopCategories.last.selectedCategories!,
                shopID: shopID,
                productID: '',
              );

              var responseAsync = ref.watch(fetchProductsProvider(params));

              return responseAsync.when(
                skipError: true,
                data: (productsData) {
                  if (productsData.error != '') {
                    return null;
                  }

                  if (indexInPage >= productsData.products!.length) {
                    return null;
                  }
                  final product = productsData.products![indexInPage];
                  return GestureDetector(
                    onTap: () => goToPage(
                      context,
                      ProductPage(productID: product.id),
                      false,
                    ),
                    child: Padding(
                      padding: index % 2 == 0
                          ? const EdgeInsets.only(left: 5)
                          : const EdgeInsets.only(right: 5),
                      child: ProductCard(
                        product: product,
                        forSimilarProducts: false,
                        forFavorites: false,
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) => errorMethod(error),
                loading: () => loadWidget,
              );
            },
          )
        : SliverGrid(
            delegate: SliverChildListDelegate([]),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 2,
            ),
          );
  }
}
