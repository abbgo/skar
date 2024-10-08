import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/models/product.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/parts/product_card/product_card.dart';
import 'package:skar/pages/product/product.dart';
import 'package:skar/providers/api/product.dart';
import 'package:skar/providers/pages/filter_categories.dart';
import 'package:skar/providers/pages/search_product.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:skar/services/product.dart';

class SearchProductResult extends ConsumerWidget {
  const SearchProductResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasProducts = ref.watch(hasProductsProvider);
    ScrollController scrollController =
        ref.watch(searchProductScrollControllerProvider);
    final bool loading = ref.watch(loadSearchProductProvider);
    List<String> selectedCategories = ref.read(selectedCategoriesProvider);

    return !hasProducts
        ? const NoResult()
        : Expanded(
            child: Stack(
              children: [
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 310,
                  ),
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;

                    ProductParams params = ProductParams(
                      api: 'products',
                      limit: pageSize,
                      page: page,
                      productID: '',
                      categories: selectedCategories,
                      shopID: '',
                    );

                    final AsyncValue<ResultProduct> products =
                        ref.watch(fetchProductsProvider(params));

                    return products.when(
                      skipLoadingOnRefresh: true,
                      skipLoadingOnReload: true,
                      skipError: true,
                      data: (response) {
                        if (response.error != '') {
                          return null;
                        }
                        if (indexInPage >= response.products!.length) {
                          return null;
                        }

                        Product product = response.products![indexInPage];
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
                      loading: () {
                        if (!loading) {
                          Future.delayed(
                            const Duration(),
                            () => ref
                                .read(loadSearchProductProvider.notifier)
                                .state = true,
                          );
                        }
                        return null;
                      },
                    );
                  },
                ),
                loading ? loadWidget : const SizedBox(),
              ],
            ),
          );
  }
}
