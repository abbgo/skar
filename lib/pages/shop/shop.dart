import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/shop/parts/products.dart';
import 'package:skar/pages/shop/parts/shop_buttons.dart';
import 'package:skar/pages/shop/parts/shop_category.dart';
import 'package:skar/pages/shop/parts/shop_image.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/pages/shop.dart';

class ShopPage extends ConsumerWidget {
  const ShopPage({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenProperties screenSize = screenProperties(context);

    bool isTM = ref.watch(isTmProvider);
    var shop = ref.watch(fetchShopProvider(shopID));
    bool openSearchBar = ref.watch(openSearchBarProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: shop.when(
        data: (shopData) {
          if (shopData.error != '') {
            return const SomeThingWrong();
          }

          return CustomScrollView(
            slivers: [
              ShopImage(shopImage: shopData.shop!.image!),
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                elevation: 0,
                scrolledUnderElevation: 0,
                toolbarHeight: screenSize.height / 5 + 20,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      shopTextMethod(
                        18,
                        isTM ? shopData.shop!.nameTM : shopData.shop!.nameRU,
                        FontWeight.bold,
                      ),
                      shopTextMethod(
                        16,
                        isTM
                            ? shopData.shop!.addressTM!
                            : shopData.shop!.addressRU!,
                        FontWeight.normal,
                      ),
                      ShopPageButtons(shop: shopData.shop!),
                      const SizedBox(height: 10),
                      ShopCategory(shopID: shopID),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              !openSearchBar
                  ? ShopProducts(shopID: shopID)
                  : const SliverFillRemaining(hasScrollBody: true),
            ],
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString(), textAlign: TextAlign.center),
        ),
        loading: () => loadWidget,
      ),
    );
  }
}
