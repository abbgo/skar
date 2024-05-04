import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';

class ShopService {
  Future<List<Shop>> fetchShopsForMap(String api) async {
    Uri uri = Uri.parse('$apiUrl/$api');
    Response response = await http.get(uri);
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['status']) {
      var shopsList = jsonData['shops'] as List;
      return shopsList
          .map<Shop>((propJson) => Shop.fromJson(propJson))
          .toList();
    }
    return [];
  }
}
