import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/category.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/models/category.dart';
import 'package:skar/services/category.dart';

class ShopCategory extends ConsumerWidget {
  const ShopCategory({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(isTmProvider);
    var categories = ref.watch(fetchCategoriesByShopIDProvider(shopID));
    Kategory category = ref.watch(fetchChildCategoriesProvider);

    return SizedBox(
      height: category.id.isEmpty ? 30 : 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          category.id.isNotEmpty ? Text(category.nameTM) : const SizedBox(),
          Expanded(
            child: category.id.isNotEmpty
                ? listCategoriesMethod(category.childCategories!, () {}, isTM)
                : categories.when(
                    data: (categories) {
                      return listCategoriesMethod(
                        categories,
                        () {
                          CategoryParam categoryParam = CategoryParam(
                              shopID: shopID,
                              categoryID:
                                  '11cf0c1a-e531-4839-a645-5759c7eeceb6');
                          ref
                              .read(fetchChildCategoriesProvider.notifier)
                              .fetchChildCategories(categoryParam);
                        },
                        isTM,
                      );
                    },
                    error: (error, stackTrace) =>
                        Center(child: Text(error.toString())),
                    loading: () => loadWidget,
                  ),
          ),
        ],
      ),
    );
  }

  ListView listCategoriesMethod(
    List<Kategory> categories,
    Function getChildCategories,
    bool isTM,
  ) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];

        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              getChildCategories();
            },
            child: Text(
              isTM ? category.nameTM : category.nameRU,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
