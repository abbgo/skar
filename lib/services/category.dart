import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/category.dart';

class CategoryService {
  // FETCH CATEGORIES BY SHOP ID -----------------------------------------------
  Future<List<Kategory>> fetchCategoriesByShopID(String shopID) async {
    final Uri uri = Uri.parse('$apiUrl/categories').replace(
      queryParameters: {'limit': '50', 'page': '1', 'shop_id': shopID},
    );

    try {
      Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['categories'] == null) return [];

        var list = jsonData['categories'] as List;
        var categories = list
            .map<Kategory>((propJson) => Kategory.fromJson(propJson))
            .toList();
        return categories;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

class ShopCategories extends Equatable {
  final String name;
  final String categoryID;
  final List<Kategory>? childCategories;
  final List<String>? selectedCategories;

  const ShopCategories({
    required this.name,
    required this.categoryID,
    this.childCategories,
    this.selectedCategories,
  });

  @override
  List<Object?> get props => [name, categoryID];
}
