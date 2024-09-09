import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterCategoriesNotifier extends StateNotifier<List<String>> {
  FilterCategoriesNotifier() : super([]);

  Future<void> addOrRemoveCategory(String categoryID) async {
    List<String> categoryIDs = state.map((e) => e).toList();
    if (!categoryIDs.contains(categoryID)) {
      state = [...state, categoryID];
    } else {
      categoryIDs.remove(categoryID);
      state = categoryIDs;
    }
  }
}
