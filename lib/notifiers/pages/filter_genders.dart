import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedProductGendersNotifier extends StateNotifier<List<dynamic>> {
  SelectedProductGendersNotifier() : super([]);

  Future<void> addGender(dynamic gender) async {
    if (!state.contains(gender)) {
      state = [...state, gender];
    }
  }

  Future<void> removeGender(dynamic gender) async {
    state = state.where((i) => i != gender).toList();
  }
}
