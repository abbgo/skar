import 'package:flutter/material.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/models/category.dart';
import 'package:skar/models/product.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
    required this.shopID,
    required this.isTM,
  });

  final String shopID;
  final bool isTM;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // VARIABLES -----------------------------------------------------------------
  Shop shop = Shop.defaultShop();
  List<Product> products = [];
  List<Kategory> categories = [];
  Kategory category = Kategory.defaultCategory();

  final ScrollController _scrollController = ScrollController();
  int page = 1;
  bool loadMore = false;

  // FUNCTIONS -----------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _getShopWithProducts();
      }
    });

    _getShopWithProducts();
  }

  _getShopWithProducts() async {
    bool hasIntConn = await checkIntConn();
    List<String> categorieIDS = [];

    if (hasIntConn) {
      setState(() {
        loadMore = true;
      });
      // get shop
      shop = await Shop.fetchShop(widget.shopID);

      // get categories by shop id
      categories = await Kategory.fetchCategories(widget.shopID);
      for (Kategory category in categories) {
        categorieIDS.add(category.id);
      }

      // get products
      List<Product> newProducts = await Product.fetchProducts(
          "products", 10, page, categorieIDS, shop.id, "");
      products.addAll(newProducts);
      page++;
      loadMore = false;

      if (mounted) setState(() {});
      return;
    }
    if (mounted) showIntConnErrSnackBar(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenProperties screenSize = screenProperties(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: shop.id == ""
          ? Center(child: CircularProgressIndicator(color: elevatedButtonColor))
          : CustomScrollView(
              controller: _scrollController,
              slivers: [
                shopImageMethod(screenSize, shop.image),
                shopDetailMethod(
                  screenSize,
                  context,
                  shop,
                  widget.isTM,
                  loadMore,
                  categories,
                  category,
                  (int categoryIndex) async {
                    category = await Kategory.fetchChildCategories(
                        shop.id, categories[categoryIndex].id);
                    setState(() {});
                  },
                ),
                SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 8,
                    mainAxisExtent: screenSize.height * 0.35,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];

                    return Hero(
                      tag: product.id,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(
                                productID: product.id,
                                isTM: widget.isTM,
                                shopID: shop.id,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(left: 5)
                              : const EdgeInsets.only(right: 5),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            elevation: 3,
                            child: productStackMethod(
                              product,
                              widget.isTM,
                              screenSize.height * 0.25,
                              double.infinity,
                              16,
                              14,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
