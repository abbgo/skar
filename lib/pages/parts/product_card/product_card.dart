import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    bool isTM = ref.watch(langProvider) == 'tr';

    return Card(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  height: 280,
                  width: 210,
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
                null,
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
                          null,
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
