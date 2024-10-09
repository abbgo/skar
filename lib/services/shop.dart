import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';

class ShopService {
  // fetch shops for map ------------------------------------
  Future<List<Shop>> fetchShopsForMap(
    String api,
    ShopParams shopParams,
    List<String> genders,
  ) async {
    Uri uri = Uri.parse('$apiUrl/$api').replace(
      queryParameters: {
        'latitude': shopParams.latitude.toString(),
        'longitude': shopParams.longitude.toString(),
        'kilometer': shopParams.kilometer.toString(),
        'genders': genders,
      },
    );

    try {
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
    } catch (e) {
      rethrow;
    }
  }

  // fetch shops -------------------------------------------------------
  Future<List<Shop>> fetchShops({
    required int page,
    required bool isRandom,
    required String search,
    required String lang,
    required String parentShopID,
    required bool isShoppingCenter,
  }) async {
    Uri uri = Uri.parse('$apiUrl/shops').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'is_random': isRandom.toString(),
        'search': search,
        'lang': lang,
        'parent_shop_id': parentShopID,
        'is_shopping_center': isShoppingCenter.toString(),
      },
    );

    try {
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
    } catch (e) {
      rethrow;
    }
  }

  // fetch shop by id
  Future<Shop> fetchShop(String shopID) async {
    try {
      Response response = await http.get(Uri.parse("$apiUrl/shops/$shopID"));
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        var propJson = jsonData['shop'];
        if (propJson == null) return Shop.defaultShop();
        return Shop.fromJson(propJson);
      }
      return Shop.defaultShop();
    } catch (e) {
      rethrow;
    }
  }

  // fetch favorite shops by ids
  Future<List<Shop>> fetchShopsByIDs({required List<String> ids}) async {
    Uri uri = Uri.parse('$apiUrl/shops/favorite')
        .replace(queryParameters: {'ids': ids});

    try {
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
    } catch (e) {
      rethrow;
    }
  }
}

class ShopParams extends Equatable {
  final double? latitude;
  final double? longitude;
  final int? kilometer;
  final bool? isRandom;
  final int? page;
  final String? parentShopID;

  const ShopParams({
    this.latitude,
    this.longitude,
    this.kilometer,
    this.isRandom,
    this.page,
    this.parentShopID,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        kilometer,
        isRandom,
        page,
        parentShopID,
      ];

  ShopParams copyWith({
    double? latitude,
    double? longitude,
    int? kilometer,
    bool? isRandom,
    String? search,
    int? page,
    String? parentShopID,
  }) {
    return ShopParams(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      kilometer: kilometer ?? this.kilometer,
      isRandom: isRandom ?? this.isRandom,
      page: page ?? this.page,
      parentShopID: parentShopID ?? this.parentShopID,
    );
  }
}
