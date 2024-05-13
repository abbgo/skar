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

  @override
  Widget build(BuildContext context) {
    ScreenProperties screenSize = screenProperties(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ShopImage(shopID: shopID),
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: screenSize.height / 5 + 20,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
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
                          const SizedBox(height: 5),
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
        ],
      ),
    );
  }
}
