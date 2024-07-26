import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/providers/api/category.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:skar/services/category.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});

  final List<Kategory> categories;

  @override
  Widget build(BuildContext context) {
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
                bool isTM = ref.watch(langProvider) == 'tr';

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
                            selectedCategories: [category.id],
                          ),
                        );
                    ref.read(hasShopProductsProvider.notifier).state = true;
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
