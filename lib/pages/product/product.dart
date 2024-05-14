import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/product/parts/price_and_brend.dart';
import 'package:skar/pages/product/parts/product_color_page.dart';
import 'package:skar/pages/product/parts/product_image.dart';
import 'package:skar/pages/product/parts/similar_products.dart';
import 'package:skar/providers/models/product.dart';
import 'package:skar/providers/pages/product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.productID,
    required this.shopID,
  });

  final String productID, shopID;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Hero(
        tag: widget.productID,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            child: Consumer(
              builder: (context, ref, child) {
                var product = ref.watch(fetchProductProvider(widget.productID));
                int selectedColors = ref.watch(selectedProductColorProvider);

                return product.when(
                  data: (product) {
                    return ListView(
                      children: [
                        ProductImage(
                          productColor: product.productColors![selectedColors],
                          pageController: _pageController,
                        ),
                        ProductPriceAndBrend(product: product),
                        ProductColorPage(
                          productColors: product.productColors!,
                          pageController: _pageController,
                        ),
                        SimilarProducts(
                          shopID: widget.shopID,
                          productID: widget.productID,
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) => Center(
                    child: Text(error.toString(), textAlign: TextAlign.center),
                  ),
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
