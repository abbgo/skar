import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/product/parts/price_and_brend.dart';
import 'package:skar/pages/product/parts/product_color_page.dart';
import 'package:skar/pages/product/parts/product_image.dart';
import 'package:skar/pages/product/parts/similar_products.dart';
import 'package:skar/providers/models/product.dart';
import 'package:skar/providers/pages/product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.productID});

  final String productID;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // VARIABLES -------------------------------------------
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Hero(
        tag: widget.productID,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            color: Colors.white,
            child: Consumer(
              builder: (context, ref, child) {
                var product = ref.watch(fetchProductProvider(widget.productID));
                int selectedColors = ref.watch(selectedProductColorProvider);

                return product.when(
                  skipError: true,
                  data: (productData) {
                    if (productData.error != '') {
                      return const SomeThingWrong();
                    }
                    return ListView(
                      children: [
                        ProductImage(
                          productColor: productData
                              .product!.productColors![selectedColors],
                          pageController: _pageController,
                        ),
                        ProductPriceAndBrend(product: productData.product!),
                        ProductColorPage(
                          productColors: productData.product!.productColors!,
                          pageController: _pageController,
                        ),
                        SimilarProducts(productID: widget.productID),
                      ],
                    );
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => loadWidget,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
