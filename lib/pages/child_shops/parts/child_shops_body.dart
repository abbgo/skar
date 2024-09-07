import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/parts/shop_list_tile/shop_list_tile.dart';
import 'package:skar/providers/api/shop.dart';
import 'package:skar/providers/pages/child_shops.dart';
import 'package:skar/services/shop.dart';

class ChildShopsBody extends ConsumerWidget {
  const ChildShopsBody({super.key, required this.parentShopID});

  final String parentShopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasShops = ref.watch(hasChildShopsProvider);
    ScrollController scrollController =
        ref.watch(childShopsScrollControllerProvider);
    bool loading = ref.watch(loadChildShopsProvider);

    return Stack(
      children: [
        !hasShops
            ? const NoResult()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: screenProperties(context).height,
                child: ListView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;

                    ShopParams shopParams = ShopParams(
                      page: page,
                      isRandom: false,
                      parentShopID: parentShopID,
                    );

                    final AsyncValue<ResultShop> responseAsync =
                        ref.watch(fetchChildShopsProvider(shopParams));

                    return responseAsync.when(
                      skipLoadingOnRefresh: true,
                      skipLoadingOnReload: true,
                      skipError: true,
                      data: (response) {
                        if (response.error != '') {
                          return null;
                        }
                        if (indexInPage >= response.shops!.length) {
                          return null;
                        }
                        final shop = response.shops![indexInPage];
                        return ShopListTile(
                          shop: shop,
                          forFavorite: false,
                        );
                      },
                      error: (error, stackTrace) => errorMethod(error),
                      loading: () {
                        if (!loading) {
                          Future.delayed(
                            const Duration(),
                            () => ref
                                .read(loadChildShopsProvider.notifier)
                                .state = true,
                          );
                        }
                        return null;
                      },
                    );
                  },
                ),
              ),
        loading ? loadWidget : const SizedBox(),
      ],
    );
  }
}
