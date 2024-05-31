import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/search_shop/parts/shop_list_tile.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

class SearchShopResult extends ConsumerWidget {
  const SearchShopResult({
    super.key,
    required this.mapController,
    required this.mapPageContext,
  });

  final Completer<GoogleMapController> mapController;
  final BuildContext mapPageContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String search = ref.watch(shopSearchProvider);
    bool hasShops = ref.watch(hasShopsProvider);
    return search != ''
        ? !hasShops
            ? const NoResult()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: screenProperties(context).height,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;

                    ShopParams shopParams =
                        ShopParams(page: page, isRandom: false);

                    final AsyncValue<ResultShop> responseAsync =
                        ref.watch(fetchShopsProvider(shopParams));

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
                          mapPageContext: mapPageContext,
                          forFavorite: false,
                        );
                      },
                      error: (error, stackTrace) => errorMethod(error),
                      loading: () {
                        return null;
                      },
                    );
                  },
                ),
              )
        : const SizedBox();
  }
}
