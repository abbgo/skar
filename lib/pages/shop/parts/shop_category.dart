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
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          category.id.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: elevatedButtonColor, size: 20),
                      Text(
                        ' >  ${category.nameTM}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          category.id.isNotEmpty
              ? listCategoriesMethod(category.childCategories!, () {}, isTM)
              : categories.when(
                  data: (categories) {
                    return listCategoriesMethod(categories, null, isTM);
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () => loadWidget,
                ),
        ],
      ),
    );
  }

  SizedBox listCategoriesMethod(
    List<Kategory> categories,
    void Function()? onPress,
    bool isTM,
  ) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    if (onPress == null) {
                      CategoryParam categoryParam = CategoryParam(
                          shopID: shopID, categoryID: category.id);
                      ref
                          .read(fetchChildCategoriesProvider.notifier)
                          .fetchChildCategories(categoryParam);
                    }
                  },
                  child: Text(
                    isTM ? category.nameTM : category.nameRU,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
