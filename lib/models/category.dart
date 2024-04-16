import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skar/helpers/static_data.dart';

class Kategory {
  final String id, nameTM, nameRU;
  final String? image;
  final List<Kategory>? childCategories;

  Kategory({
    required this.nameTM,
    required this.id,
    required this.nameRU,
    this.image,
    this.childCategories,
  });

  factory Kategory.defaultCategory() {
    return Kategory(
      id: '',
      nameRU: '',
      nameTM: '',
      image: '',
    );
  }

  factory Kategory.fromJson(Map<String, dynamic> json) {
    return Kategory(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      image: json['image'] ?? "",
      childCategories: json['child_categories'] == null
          ? []
          : List<Kategory>.from(
              json['child_categories'].map(
                (dataJson) => Kategory.fromJson(dataJson),
              ),
            ),
    );
  }

  static Future<List<Kategory>> fetchCategories(String shopID) async {
    final Uri uri = Uri.parse('$apiUrl/categories/$shopID');

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
  }

  static Future<Kategory> fetchChildCategories(
      String shopID, String categoryID) async {
    final Uri uri = Uri.parse('$apiUrl/categories/$shopID/$categoryID');

    Response response = await http.get(uri);
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['status']) {
      if (jsonData['category'] == null) return Kategory.defaultCategory();

      var dataJson = jsonData['category'];
      return Kategory.fromJson(dataJson);
    }
    return Kategory.defaultCategory();
  }
}
