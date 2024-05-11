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
    var shopCategories = ref.watch(shopCategoriesProvider);

    return categories.when(
      data: (categories) {
        return SizedBox(
          height: 70,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (shopCategories.isNotEmpty)
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await ref
                              .read(shopCategoriesProvider.notifier)
                              .clearCategories();
                        },
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                        ),
                        icon: Icon(Icons.home, color: elevatedButtonColor),
                      ),
                      Icon(Icons.chevron_right, color: elevatedButtonColor),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: shopCategories.length,
                          itemBuilder: (context, index) {
                            var shopCategory = shopCategories[index];

                            return TextButton(
                              onPressed: () async {
                                if (shopCategory.childCategories!.isNotEmpty) {
                                  for (var c in shopCategories) {
                                    if (c.categoryID ==
                                            shopCategory.categoryID &&
                                        shopCategory
                                            .childCategories!.isNotEmpty) {
                                      await ref
                                          .read(shopCategoriesProvider.notifier)
                                          .deleteCategoriesByIndex(index);
                                    }
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                              ),
                              child: Text(shopCategory.name,
                                  style: TextStyle(color: elevatedButtonColor)),
                            );
                          },
                          separatorBuilder: (context, index) => Icon(
                              Icons.chevron_right,
                              color: elevatedButtonColor),
                        ),
                      ),
                    ],
                  ),
                )
              else
                const SizedBox(),
              listCategoriesMethod(
                shopCategories.isEmpty
                    ? categories
                    : shopCategories.last.childCategories!,
                null,
                isTM,
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => SizedBox(height: 70, child: loadWidget),
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
                  onPressed: () async {
                    await ref.read(shopCategoriesProvider.notifier).addCategory(
                          ShopCategories(
                            categoryID: category.id,
                            name: isTM ? category.nameTM : category.nameRU,
                            childCategories: category.childCategories,
                          ),
                        );
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
