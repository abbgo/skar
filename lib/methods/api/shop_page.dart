import 'package:flutter/material.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/models/shop.dart';

// Future<Shop> getShopData(String shopID, BuildContext context) async {
//   bool hasIntConn = await checkIntConn();
//   if (hasIntConn) {
//     return await Shop.fetchShop(shopID);
//   }
//   showInt() {
//     showIntConnErrSnackBar(context);
//   }

//   showInt();
//   return Shop.defaultShop();
// }

// getShopWithProducts(String shopID, BuildContext context) async {
//   bool hasIntConn = await checkIntConn();
//   List<String> categorieIDS = [];

//   if (hasIntConn) {
//     // get shop
//     var shop = await Shop.fetchShop(shopID);

//     // get categories by shop id
//     var categories = await Kategory.fetchCategories(shopID);
//     for (Kategory category in categories) {
//       categorieIDS.add(category.id);
//     }

//     // get products
//     List<Product> newProducts = await Product.fetchProducts(
//         "products", 10, page, categorieIDS, shopID, "");
//     products.addAll(newProducts);
//     page++;
//     loadMore = false;

//     return;
//   }

//   () {
//     showIntConnErrSnackBar(context);
//   };
// }
