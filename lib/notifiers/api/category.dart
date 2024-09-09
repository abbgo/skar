import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/services/category.dart';

class ShopCategoriesNotifier extends StateNotifier<List<ShopCategories>> {
  ShopCategoriesNotifier() : super([]);

  Future<void> addCategory(ShopCategories shopCategory) async {
    state = [...state, shopCategory];
  }

  Future<void> deleteCategoriesByIndex(int index) async {
    state = state.sublist(0, index + 1);
  }
}
