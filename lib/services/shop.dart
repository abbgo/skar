// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';

class ShopService {
  // fetch shops for map ------------------------------------
  Future<List<Shop>> fetchShopsForMap(String api, ShopParams shopParams) async {
    Uri uri = Uri.parse('$apiUrl/$api').replace(
      queryParameters: {
        'latitude': shopParams.latitude.toString(),
        'longitude': shopParams.longitude.toString(),
        'kilometer': shopParams.kilometer.toString(),
        'search': shopParams.search,
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
  Future<List<Shop>> fetchShops({required int page}) async {
    Uri uri = Uri.parse('$apiUrl/shops').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'is_brend': 'true',
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
}

class ShopParams extends Equatable {
  final double? latitude;
  final double? longitude;
  final int? kilometer;
  final String? search;

  const ShopParams({
    this.latitude,
    this.longitude,
    this.kilometer,
    this.search,
  });

  @override
  List<Object?> get props => [latitude, longitude, kilometer, search];

  ShopParams copyWith({
    double? latitude,
    double? longitude,
    int? kilometer,
    String? search,
  }) {
    return ShopParams(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      kilometer: kilometer ?? this.kilometer,
      search: search ?? this.search,
    );
  }
}
