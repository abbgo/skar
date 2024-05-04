import 'dart:convert';
import 'package:http/http.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:http/http.dart' as http;

class Shop {
  final String id, nameTM, nameRU;
  final String? addressTM, addressRU;
  final String? image;
  final double latitude, longitude;
  final List<dynamic>? phones;
  // final List<Product>? products;
  // final List<Kategory>? categories;

  Shop({
    required this.id,
    required this.nameRU,
    required this.nameTM,
    required this.latitude,
    required this.longitude,
    this.image,
    this.addressTM,
    this.addressRU,
    this.phones,
    // this.products,
    // this.categories,
  });

  factory Shop.defaultShop() {
    return Shop(
      id: '',
      nameRU: '',
      nameTM: '',
      latitude: 0,
      longitude: 0,
      image: '',
      addressTM: '',
      addressRU: '',
      phones: [],
    );
  }

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      nameRU: json['name_ru'],
      nameTM: json['name_tm'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      image: json['image'] ?? "",
      addressTM: json['address_tm'] ?? "",
      addressRU: json['address_ru'] ?? "",
      phones: json['phones'] ?? [],
      // categories: json['shop_categories'] == null
      //     ? []
      //     : List<Kategory>.from(
      //         json['shop_categories'].map(
      //           (categoryJson) => Kategory.fromJson(categoryJson),
      //         ),
      //       ),
      // products: json['products'] == null
      //     ? []
      //     : List<Product>.from(
      //         json['products'].map(
      //           (productJson) => Product.fromJson(productJson),
      //         ),
      //       ),
    );
  }

  static Future<List<Shop>> fetchShops(
    String api,
    int limit,
    int page,
    bool isBrend,
  ) async {
    Uri uri = Uri.parse('$apiUrl/$api').replace(queryParameters: {
      'limit': limit.toString(),
      'page': page.toString(),
      'is_brend': isBrend.toString(),
    });

    Response response = await http.get(uri);
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['status']) {
      if (jsonData['shops'] == null) return [];
      var shopsList = jsonData['shops'] as List;
      return shopsList
          .map<Shop>((propJson) => Shop.fromJson(propJson))
          .toList();
    }
    return [];
  }

  static Future<Shop> fetchShop(String shopID) async {
    Response response = await http.get(Uri.parse("$apiUrl/shops/$shopID"));
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['status']) {
      var propJson = jsonData['shop'];
      return Shop.fromJson(propJson);
    }
    return Shop.defaultShop();
  }
}
