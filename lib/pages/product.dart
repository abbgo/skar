import 'package:flutter/material.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/product.dart';
import 'package:skar/models/product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage(
      {super.key,
      required this.productID,
      required this.isTM,
      required this.shopID});

  final String productID;
  final String shopID;
  final bool isTM;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // VARIABLES -----------------------------------------------------------------
  Product product = Product.defaultProduct();
  List<Product> similarProducts = [];
  int _activePage = 0;
  int _selectedColor = 0;
  final PageController _pageController = PageController(initialPage: 0);

  // FUNCTIONS -----------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _getProductData();
  }

  _getProductData() async {
    bool hasIntConn = await checkIntConn();

    if (hasIntConn) {
      // product alynyar
      product = await Product.fetchProduct(widget.productID);

      // sol produkta menzes product -lar alynyar
      List<Product> newProducts = await Product.fetchProducts(
          "products/similars", 10, 1, [], widget.shopID, widget.productID);
      similarProducts.addAll(newProducts);

      if (mounted) setState(() {});
      return;
    }
    if (mounted) showIntConnErrSnackBar(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenProperties screenSize = screenProperties(context);

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
          child: product.id == ""
              ? Center(
                  child: CircularProgressIndicator(color: elevatedButtonColor))
              : ListView(
                  children: [
                    productImageMethod(
                      context,
                      _pageController,
                      product.productColors![_selectedColor],
                      _activePage,
                      (value) {
                        setState(() {
                          _activePage = value;
                        });
                      },
                    ),
                    productPriceAndBrendMethod(product, widget.isTM),
                    productColorsMethod(
                      context,
                      product.productColors,
                      _selectedColor,
                      (value) {
                        setState(() {
                          _selectedColor = value;
                          _activePage = 0;
                        });
                      },
                    ),
                    similarProducts.isNotEmpty
                        ? similarProductsMethod(context, screenSize,
                            similarProducts, widget.isTM, widget.shopID)
                        : const SizedBox(),
                  ],
                ),
        ),
      ),
    );
  }
}
