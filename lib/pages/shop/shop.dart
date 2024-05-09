import 'package:flutter/material.dart';
import 'package:skar/pages/shop/parts/shop_image.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // controller: _scrollController,
        slivers: [
          // shopImageMethod(screenSize, shopID, context),
          ShopImage(shopID: shopID),
          // shopDetailMethod(
          //   screenSize,
          //   context,
          //   shop,
          //   widget.isTM,
          //   loadMore,
          //   categories,
          //   category,
          //   (int categoryIndex) async {
          //     category = await Kategory.fetchChildCategories(
          //         shop.id, categories[categoryIndex].id);
          //     setState(() {});
          //   },
          // ),
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
