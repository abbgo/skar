import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/category.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/parts/filter_categories/parts/filter_categories_card.dart';
import 'package:skar/providers/api/category.dart';

class ResultFilterCategories extends ConsumerWidget {
  const ResultFilterCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ResultCategory> resultCategory =
        ref.watch(fetchCategoriesProvider);

    return resultCategory.when(
      data: (response) {
        if (response.error != '') {
          return errorMethod(response.error);
        }
        if (response.categories!.isEmpty) {
          return const NoResult();
        }

        List<Kategory> categories = response.categories!;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              Kategory category = categories[index];
              return FilterCategoriesCard(category: category);
            },
          ),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
