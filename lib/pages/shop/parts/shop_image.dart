import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/providers/models/shop.dart';

class ShopImage extends StatelessWidget {
  const ShopImage({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var shop = ref.watch(fetchShopProvider(shopID));

        return SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: screenProperties(context).height / 4,
          automaticallyImplyLeading: false,
          flexibleSpace: shop.when(
            data: (data) {
              return showCachImageMethod(data.image!);
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => loadWidget,
          ),
        );
      },
    );
  }
}
