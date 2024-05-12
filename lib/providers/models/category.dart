import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/services/category.dart';

final categoryApiProvider =
    Provider<CategoryService>((ref) => CategoryService());

var fetchCategoriesByShopIDProvider = FutureProvider.autoDispose
    .family<List<Kategory>, String>((ref, shopID) async {
  var categories =
      await ref.read(categoryApiProvider).fetchCategoriesByShopID(shopID);
  await ref.read(shopCategoriesProvider.notifier).addCategory(
        ShopCategories(
          categoryID: '',
          name: '',
          childCategories: categories,
          selectedCategories:
              List.generate(categories.length, (index) => categories[index].id),
        ),
      );

  return categories;
});

// ----------------------------------------------------------------------------
class ShopCategoriesNotifier extends StateNotifier<List<ShopCategories>> {
  ShopCategoriesNotifier() : super([]);

  Future<void> addCategory(ShopCategories shopCategory) async {
    state = [...state, shopCategory];
  }

  Future<void> deleteCategoriesByIndex(int index) async {
    state = state.sublist(0, index + 1);
  }

  Future<void> clearCategories() async {
    state = [];
  }
}

var shopCategoriesProvider =
    StateNotifierProvider<ShopCategoriesNotifier, List<ShopCategories>>((ref) {
  return ShopCategoriesNotifier();
});
