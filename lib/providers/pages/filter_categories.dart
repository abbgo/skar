import 'package:flutter_riverpod/flutter_riverpod.dart';

var selectedCategoriesProvider =
    StateProvider.autoDispose<List<String>>((ref) => []);
