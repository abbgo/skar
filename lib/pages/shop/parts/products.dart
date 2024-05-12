import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/product.dart';
import 'package:skar/providers/models/category.dart';
import 'package:skar/providers/models/product.dart';
import 'package:skar/services/product.dart';

class ShopProducts extends ConsumerWidget {
  const ShopProducts({super.key, required this.shopID});
  final String shopID;

  static const pageSize = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('======================================');
    ScreenProperties screenSize = screenProperties(context);
    var shopCategories = ref.watch(shopCategoriesProvider);

    print('----------------- ${shopCategories.length}');
    print(shopCategories.last.selectedCategories);

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 8,
        mainAxisExtent: screenSize.height * 0.35,
      ),
      itemCount: 1,
      itemBuilder: (context, index) {
        print('--------------------- ${shopCategories.isEmpty}');
        return const SizedBox();
        // final page = index ~/ pageSize + 1;
        // final indexInPage = index % pageSize;
        // ProductParams params =
        //     ProductParams(categories: categoryIDs, page: page, shopID: shopID);

        // final AsyncValue<List<Product>> responseAsync =
        //     ref.watch(fetchProductsProvider(params));

        // return responseAsync.when(
        //   data: (response) {
        //     if (indexInPage >= response.length) {
        //       return null;
        //     }
        //     final product = response[indexInPage];

        //     return Text(product.nameTM);
        //   },
        //   error: (error, stackTrace) => Center(child: Text(error.toString())),
        //   loading: () => loadWidget,
        // );
      },
    );
  }
}
