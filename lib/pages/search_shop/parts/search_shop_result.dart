import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/services/shop.dart';

class SearchShopResult extends ConsumerWidget {
  const SearchShopResult({super.key});

  static const pageSize = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          ShopParams shopParams = ShopParams(page: page, isBrend: false);

          final AsyncValue<ResultShop> responseAsync =
              ref.watch(fetchShopsProvider(shopParams));

          return responseAsync.when(
            data: (response) {
              if (response.error != '') {
                return const SomeThingWrong();
              }

              if (indexInPage >= response.shops!.length) {
                return null;
              }
              final shop = response.shops![indexInPage];
              return Text(shop.nameTM);
            },
            error: (error, stackTrace) => errorMethod(error),
            loading: () => loadWidget,
          );
        },
      ),
    );
  }
}
