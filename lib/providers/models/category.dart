import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/services/category.dart';

final categoryApiProvider =
    Provider<CategoryService>((ref) => CategoryService());

var fetchCategoriesByShopIDProvider =
    FutureProvider.family<List<Kategory>, String>((ref, shopID) =>
        ref.read(categoryApiProvider).fetchCategoriesByShopID(shopID));

class ChildCategoriesNotifier extends StateNotifier<Kategory> {
  ChildCategoriesNotifier() : super(Kategory.defaultCategory());

  void fetchChildCategories(CategoryParam categoryParam) async {
    var category = await CategoryService.fetchChildCategories(
        categoryParam.shopID, categoryParam.categoryID);
    state = category;
  }
}

var fetchChildCategoriesProvider =
    StateNotifierProvider.autoDispose<ChildCategoriesNotifier, Kategory>(
        (ref) => ChildCategoriesNotifier());
