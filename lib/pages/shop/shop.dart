import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/pages/shop/parts/products.dart';
import 'package:skar/pages/shop/parts/shop_category.dart';
import 'package:skar/pages/shop/parts/shop_image.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key, required this.shopID});

  final String shopID;
  // Shop shop = Shop.defaultShop();
  // List<Product> products = [];
  // List<Kategory> categories = [];
  // Kategory category = Kategory.defaultCategory();

  // final ScrollController _scrollController = ScrollController();
  // int page = 1;
  // bool loadMore = false;

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    ScreenProperties screenSize = screenProperties(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // controller: _scrollController,
        slivers: [
          // SHOP IMAGE-------------------
          ShopImage(shopID: shopID),
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: screenSize.height / 5,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Consumer(
                builder: (context, ref, child) {
                  bool isTM = ref.watch(isTmProvider);
                  var shop = ref.watch(fetchShopProvider(shopID));

                  return shop.when(
                    data: (data) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          shopTextMethod(18, isTM ? data.nameTM : data.nameRU,
                              FontWeight.bold),
                          shopTextMethod(
                            16,
                            isTM ? data.addressTM! : data.addressRU!,
                            FontWeight.normal,
                          ),
                          shopButtonsMethod(context, data),
                          const SizedBox(height: 10),
                          ShopCategory(shopID: shopID),
                        ],
                      );
                    },
                    error: (error, stackTrace) =>
                        Center(child: Text(error.toString())),
                    loading: () => loadWidget,
                  );
                },
              ),
            ),
          ),
          ShopProducts(shopID: shopID),

          // SliverGrid.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 2,
          //     mainAxisSpacing: 8,
          //     mainAxisExtent: screenSize.height * 0.35,
          //   ),
          //   itemCount: products.length,
          //   itemBuilder: (context, index) {
          //     Product product = products[index];

          //     return Hero(
          //       tag: product.id,
          //       child: GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => ProductPage(
          //                 productID: product.id,
          //                 isTM: widget.isTM,
          //                 shopID: widget.shopID,
          //               ),
          //             ),
          //           );
          //         },
          //         child: Padding(
          //           padding: index % 2 == 0
          //               ? const EdgeInsets.only(left: 5)
          //               : const EdgeInsets.only(right: 5),
          //           child: Card(
          //             surfaceTintColor: Colors.white,
          //             color: Colors.white,
          //             elevation: 3,
          //             child: productStackMethod(
          //               product,
          //               widget.isTM,
          //               screenSize.height * 0.25,
          //               double.infinity,
          //               16,
          //               14,
          //             ),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
