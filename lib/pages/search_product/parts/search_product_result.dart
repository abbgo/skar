import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/parts/product_card/product_card.dart';
import 'package:skar/pages/product/product.dart';
import 'package:skar/providers/models/product.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:skar/services/product.dart';

class SearchProductResult extends ConsumerWidget {
  const SearchProductResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String search = ref.watch(productSearchProvider);
    bool hasProducts = ref.watch(hasProductsProvider);

    return Expanded(
      child: search != ''
          ? !hasProducts
              ? const NoResult()
              : CustomScrollView(
                  slivers: [
                    SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 8,
                        mainAxisExtent: screenProperties(context).height * 0.35,
                      ),
                      itemBuilder: (context, index) {
                        final page = index ~/ pageSize + 1;
                        final indexInPage = index % pageSize;

                        ProductParams params = ProductParams(
                          api: 'products',
                          limit: 10,
                          page: page,
                          productID: '',
                          categories: const [],
                          shopID: '',
                        );

                        var responseAsync =
                            ref.watch(fetchProductsProvider(params));

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
                            return Hero(
                              tag: product.id,
                              child: GestureDetector(
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
                              ),
                            );
                          },
                          error: (error, stackTrace) => errorMethod(error),
                          loading: () => null,
                        );
                      },
                    )
                  ],
                )
          : const SizedBox(),
    );
  }
}
