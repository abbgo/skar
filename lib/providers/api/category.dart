import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/notifiers/api/category.dart';
import 'package:skar/services/category.dart';

final categoryApiProvider =
    Provider<CategoryService>((ref) => CategoryService());

var fetchCategoriesByShopIDProvider =
    FutureProvider.autoDispose.family<ResultCategory, String>(
  (ref, shopID) async {
    ResultCategory result = ResultCategory.defaultResult();

    try {
      List<Kategory> categories =
          await ref.read(categoryApiProvider).fetchCategoriesByShopID(shopID);

      await ref.read(shopCategoriesProvider.notifier).addCategory(
            ShopCategories(
              categoryID: '',
              name: '',
              childCategories: categories,
              selectedCategories: List.generate(
                categories.length,
                (index) => categories[index].id,
              ),
            ),
          );

      result = ResultCategory(error: '', categories: categories);
    } catch (e) {
      result = ResultCategory(error: e.toString());
    }

    return result;
  },
);

var fetchCategoriesProvider = FutureProvider.autoDispose<ResultCategory>(
  (ref) async {
    ResultCategory result = ResultCategory.defaultResult();

    try {
      List<Kategory> categories =
          await ref.read(categoryApiProvider).fetchCategoriesByShopID('');

      result = ResultCategory(error: '', categories: categories);
    } catch (e) {
      result = ResultCategory(error: e.toString());
    }

    return result;
  },
);

var shopCategoriesProvider = StateNotifierProvider.autoDispose<
    ShopCategoriesNotifier,
    List<ShopCategories>>((ref) => ShopCategoriesNotifier());
