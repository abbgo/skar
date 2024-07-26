import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/shop/parts/categories_list.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/api/category.dart';
import 'package:skar/providers/params/product_param.dart';

class ShopCategory extends ConsumerWidget {
  const ShopCategory({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    var categories = ref.watch(fetchCategoriesByShopIDProvider(shopID));
    var shopCategories = ref.watch(shopCategoriesProvider);

    return categories.when(
      skipError: true,
      data: (categoriesData) {
        if (categoriesData.error != '') {
          return const SomeThingWrong();
        }
        return SizedBox(
          height: 65,
          child: Column(
            verticalDirection: shopCategories.length > 1
                ? VerticalDirection.down
                : VerticalDirection.up,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (shopCategories.length > 1)
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await ref
                              .read(shopCategoriesProvider.notifier)
                              .deleteCategoriesByIndex(0);
                          ref.read(hasShopProductsProvider.notifier).state =
                              true;
                        },
                        style: IconButton.styleFrom(
                          backgroundColor:
                              isLightBrightness ? null : scaffoldColorDarkTheme,
                          padding: const EdgeInsets.symmetric(vertical: 3),
                        ),
                        icon: Icon(
                          Icons.home,
                          color: isLightBrightness
                              ? elevatedButtonColor
                              : Colors.white,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: shopCategories.length,
                          itemBuilder: (context, index) {
                            var shopCategory = shopCategories[index];

                            return shopCategory.categoryID != ''
                                ? TextButton(
                                    onPressed: () async {
                                      if (shopCategory
                                          .childCategories!.isNotEmpty) {
                                        for (var c in shopCategories) {
                                          if (c.categoryID ==
                                                  shopCategory.categoryID &&
                                              shopCategory.childCategories!
                                                  .isNotEmpty) {
                                            await ref
                                                .read(shopCategoriesProvider
                                                    .notifier)
                                                .deleteCategoriesByIndex(index);
                                          }
                                        }
                                      }
                                      ref
                                          .read(
                                              hasShopProductsProvider.notifier)
                                          .state = true;
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2,
                                        horizontal: 5,
                                      ),
                                    ),
                                    child: Text(
                                      shopCategory.name,
                                      style: TextStyle(
                                        color: isLightBrightness
                                            ? elevatedButtonColor
                                            : Colors.white,
                                      ),
                                    ),
                                  )
                                : const SizedBox();
                          },
                          separatorBuilder: (context, index) => Icon(
                            Icons.chevron_right,
                            color: isLightBrightness
                                ? elevatedButtonColor
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                const SizedBox(),
              CategoriesList(
                categories: shopCategories.length > 1
                    ? shopCategories.last.childCategories!
                    : categoriesData.categories!,
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) =>
          SizedBox(height: 65, child: errorMethod(error)),
      loading: () => SizedBox(height: 65, child: loadWidget),
    );
  }

  // SizedBox listCategoriesMethod(List<Kategory> categories, bool isTM) {
  //   ;
  // }
}
