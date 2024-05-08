import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';

class ShopService {
  // fetch shops for map ------------------------------------
  Future<List<Shop>> fetchShopsForMap(String api) async {
    Uri uri = Uri.parse('$apiUrl/$api');
    try {
      Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        var shopsList = jsonData['shops'] as List;
        shopsList.map<Shop>((propJson) => Shop.fromJson(propJson)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // fetch shops -------------------------------------------------------
  Future<List<Shop>> fetchShops(
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
      return [];
    }
  }
}

class ShopParam extends Equatable {
  final String api;
  final int limit = 3;
  final bool isBrend = true;

  const ShopParam({required this.api});

  @override
  List<Object?> get props => [api, limit, isBrend];
}
