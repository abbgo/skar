import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/notifiers/pages/filter_categories.dart';

final selectedCategoriesProvider =
    StateNotifierProvider<FilterCategoriesNotifier, List<String>>(
  (ref) => FilterCategoriesNotifier(),
);
