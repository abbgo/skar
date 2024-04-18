import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/brend.dart';
import 'package:skar/models/product_color.dart';

class Product {
  final String id, nameTM, nameRU;
  final String? image, brendID;
  final num? price, oldPrice;
  final List<ProductColor>? productColors;
  final Brend? brend;

  Product({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    required this.image,
    required this.price,
    required this.oldPrice,
    this.productColors,
    this.brendID,
    this.brend,
  });

  factory Product.defaultProduct() {
    return Product(
      id: '',
      nameRU: '',
      nameTM: '',
      image: '',
      price: null,
      oldPrice: null,
      productColors: [],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      image: json['image'] ?? "",
      price: json['price'],
      oldPrice: json['old_price'] ?? 0,
      productColors: json['product_colors'] == null
          ? []
          : List<ProductColor>.from(
              json['product_colors'].map(
                (productJson) => ProductColor.fromJson(productJson),
              ),
            ),
      brendID: json['brend_id'] ?? "",
      brend: json['brend'] == null
          ? Brend.defaultBrend()
          : Brend.fromJson(json['brend']),
    );
  }

  static Future<Product> fetchProduct(String productID) async {
    Response response =
        await http.get(Uri.parse("$apiUrl/products/$productID"));
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['status']) {
      var propJson = jsonData['product'];
      return Product.fromJson(propJson);
    }
    return Product.defaultProduct();
  }

  static Future<List<Product>> fetchProducts(
    String api,
    int limit,
    int page,
    List<String> categories,
    String shopID,
    String productID,
  ) async {
    final Uri uri = Uri.parse('$apiUrl/$api').replace(queryParameters: {
      'limit': limit.toString(),
      'page': page.toString(),
      'categories': categories,
      'shop_id': shopID,
      'product_id': productID,
    });

    Response response = await http.get(uri);
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['status']) {
      if (jsonData['products'] == null) return [];
      var list = jsonData['products'] as List;
      return list
          .map<Product>((propJson) => Product.fromJson(propJson))
          .toList();
    }
    return [];
  }
}
