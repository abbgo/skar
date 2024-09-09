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

  Future<void> addOrRemoveFilterCategory(ShopCategories category) async {
    List<ShopCategories> categories = state.map((e) => e).toList();
    if (!categories.contains(category)) {
      state = [...state, category];
    } else {
      categories.remove(category);
      state = categories;
    }
  }

  Future<void> removeAllFilterCategories() async {
    state = [];
  }
}
