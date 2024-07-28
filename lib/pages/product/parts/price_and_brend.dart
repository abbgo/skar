import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/product.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/product.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class ProductPriceAndBrend extends StatelessWidget {
  const ProductPriceAndBrend({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    bool isTM = ref.watch(langProvider) == 'tr';
                    return GestureDetector(
                      onTap: () => goToPage(
                          context, ShopPage(shopID: product.shop!.id!), false),
                      child: Consumer(
                        builder: (context, ref, child) {
                          bool isLightBrightness = isLightTheme(context, ref);
                          return Text(
                            isTM
                                ? product.shop!.nameTM!
                                : product.shop!.nameRU!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: isLightBrightness
                                  ? elevatedButtonColor
                                  : null,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    bool isTM = ref.watch(langProvider) == 'tr';
                    return Text(
                      isTM ? product.nameTM : product.nameRU,
                      style: const TextStyle(fontSize: 18),
                    );
                  },
                ),
                productPriceMethod(product.price, product.oldPrice),
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (product.brend!.name != "")
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: showCachImageMethod(product.brend!.image!),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
