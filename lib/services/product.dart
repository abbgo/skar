import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts(
    String api,
    int limit,
    int page,
    List<String> categories,
    String shopID,
    String productID,
    String search,
    String lang,
    String sort,
    String minPrice,
    String maxPrice,
    List<String> genders,
  ) async {
    final Uri uri = Uri.parse('$apiUrl/$api').replace(
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
        'categories': categories,
        'shop_id': shopID,
        'product_id': productID,
        'search': search,
        'lang': lang,
        'sort': sort,
        'min_price': minPrice,
        'max_price': maxPrice,
        'genders': genders,
      },
    );

    try {
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
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> fetchProduct(String productID) async {
    try {
      Response response =
          await http.get(Uri.parse("$apiUrl/products/$productID"));
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['product'] == null) return Product.defaultProduct();
        return Product.fromJson(jsonData['product']);
      }
      return Product.defaultProduct();
    } catch (e) {
      rethrow;
    }
  }

  // fetch favorite products by ids
  Future<List<Product>> fetchProductsByIDs({required List<String> ids}) async {
    Uri uri = Uri.parse('$apiUrl/products/favorite')
        .replace(queryParameters: {'ids': ids});

    try {
      Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['products'] == null) return [];
        var productsList = jsonData['products'] as List;
        return productsList
            .map<Product>((propJson) => Product.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

class ProductParams extends Equatable {
  final String api;
  final int limit;
  final int page;
  final List<String> categories;
  final String shopID;
  final String productID;

  const ProductParams({
    required this.api,
    required this.limit,
    required this.page,
    required this.categories,
    required this.shopID,
    required this.productID,
  });

  @override
  List<Object?> get props => [
        api,
        limit,
        page,
        categories,
        shopID,
        productID,
      ];
}
