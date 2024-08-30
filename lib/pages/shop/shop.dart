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
import 'package:skar/providers/api/shop.dart';
import 'package:skar/providers/pages/product.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:skar/styles/colors.dart';

class ShopPage extends ConsumerWidget {
  const ShopPage({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenProperties screenSize = screenProperties(context);
    bool isLightBrightness = isLightTheme(context, ref);

    bool isTM = ref.watch(langProvider) == 'tr';
    var shop = ref.watch(fetchShopProvider(shopID));
    bool hasProducts = ref.watch(hasShopProductsProvider);
    ScrollController scrollController =
        ref.watch(productScrollControllerProvider);
    bool openProductNavigateToTopButton =
        ref.watch(openProductNavigateToTopButtonProvider);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          ref.read(priceRangeProvider.notifier).state = '0-0';
          ref.read(sortProductPriceProvider.notifier).state = '';
          return;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: shop.when(
          skipError: true,
          data: (shopData) {
            if (shopData.error != '') {
              return const SomeThingWrong();
            }

            return CustomScrollView(
              controller: scrollController,
              slivers: [
                ShopImage(shop: shopData.shop!),
                SliverAppBar(
                  backgroundColor:
                      isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
                  pinned: true,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  toolbarHeight: screenSize.height / 5 + 60,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        shopTextMethod(
                          18,
                          isTM
                              ? shopData.shop!.nameTM!
                              : shopData.shop!.nameRU!,
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
                hasProducts
                    ? ShopProducts(shopID: shopID)
                    : const SliverFillRemaining(
                        hasScrollBody: true,
                        child: NoResult(),
                      ),
              ],
            );
          },
          error: (error, stackTrace) => errorMethod(error),
          loading: () => loadWidget,
        ),
        floatingActionButton: openProductNavigateToTopButton
            ? FloatingActionButton(
                onPressed: () async {
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: Icon(
                  Icons.arrow_upward,
                  color: isLightBrightness ? Colors.white : Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
