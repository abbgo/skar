import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

class SearchShopResult extends ConsumerWidget {
  const SearchShopResult({super.key, required this.shopParams});

  static const pageSize = 10;
  final ShopParams shopParams;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ShopParams shopParams = ref.watch(shopParamProvider);
    return shopParams.search != null
        ? Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                shopParams = shopParams.copyWith(page: page);

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
          )
        : const SizedBox();
  }
}
