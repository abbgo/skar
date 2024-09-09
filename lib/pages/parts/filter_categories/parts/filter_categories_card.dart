import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/category.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class FilterCategoriesCard extends ConsumerWidget {
  const FilterCategoriesCard({super.key, required this.category});

  final Kategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(langProvider) == 'tr';

    return Text(isTM ? category.nameTM : category.nameRU);
  }
}
