import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/category.dart';

class CategoryService {
  // FETCH CATEGORIES BY SHOP ID -----------------------------------------------
  Future<List<Kategory>> fetchCategoriesByShopID(String shopID) async {
    final Uri uri = Uri.parse('$apiUrl/categories/$shopID');

    try {
      Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['categories'] == null) return [];

        var list = jsonData['categories'] as List;
        return list
            .map<Kategory>((propJson) => Kategory.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // FETCH CHILD CATEGORIES BY CATEGORY ID -------------------------------------
  static Future<Kategory> fetchChildCategories(
    String shopID,
    String categoryID,
  ) async {
    final Uri uri = Uri.parse('$apiUrl/categories/$shopID/$categoryID');

    try {
      Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['category'] == null) return Kategory.defaultCategory();

        var dataJson = jsonData['category'];
        return Kategory.fromJson(dataJson);
      }
      return Kategory.defaultCategory();
    } catch (e) {
      return Kategory.defaultCategory();
    }
  }
}

class CategoryParam extends Equatable {
  final String shopID;
  final String categoryID;
  const CategoryParam({required this.shopID, required this.categoryID});

  @override
  List<Object?> get props => [shopID, categoryID];
}
