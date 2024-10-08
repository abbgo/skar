import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/parts/product_card/product_card.dart';
import 'package:skar/pages/product/product.dart';
import 'package:skar/providers/api/product.dart';
import 'package:skar/services/product.dart';

class SimilarProducts extends ConsumerWidget {
  const SimilarProducts({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductParams params = ProductParams(
      api: 'products/similars',
      limit: pageSize,
      page: 1,
      categories: const [],
      shopID: '',
      productID: productID,
    );

    var similarProducts = ref.watch(fetchProductsProvider(params));

    return similarProducts.when(
      skipError: true,
      data: (productsData) {
        if (productsData.error != '') {
          return const SomeThingWrong();
        }
        if (productsData.products!.isEmpty) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleMethod(
              context,
              AppLocalizations.of(context)!.similarProducts,
            ),
            SizedBox(
              height: 310,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productsData.products!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => goToPage(
                      context,
                      ProductPage(productID: productsData.products![index].id),
                      false,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ProductCard(
                        product: productsData.products![index],
                        forSimilarProducts: true,
                        forFavorites: false,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
