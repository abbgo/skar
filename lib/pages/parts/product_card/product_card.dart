import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/models/product.dart';
import 'package:skar/pages/parts/product_card/parts/product_favorite_button.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.forSimilarProducts,
    required this.forFavorites,
  });

  final Product product;
  final bool forSimilarProducts;
  final bool forFavorites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenProperties screenSize = screenProperties(context);
    bool isTM = ref.watch(langProvider) == 'tr';

    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      elevation: 3,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  width: forSimilarProducts
                      ? screenSize.width * .5 - 30
                      : double.infinity,
                  height: screenSize.height * .25,
                  imageUrl: "$pathUrl/${product.image}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      loadWidget,
                  errorWidget: (context, url, error) => errImage,
                  fit: BoxFit.cover,
                ),
              ),
              shopCardTextMethod(
                isTM ? product.nameTM : product.nameRU,
                16,
                TextDecoration.none,
                FontWeight.bold,
                Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shopCardTextMethod(
                    "${product.price} man",
                    14,
                    TextDecoration.none,
                    FontWeight.bold,
                    Colors.red,
                  ),
                  product.oldPrice != 0
                      ? shopCardTextMethod(
                          "${product.oldPrice} man",
                          14,
                          TextDecoration.lineThrough,
                          FontWeight.normal,
                          Colors.black,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
          ProductFavoriteButton(productID: product.id),
        ],
      ),
    );
  }
}
