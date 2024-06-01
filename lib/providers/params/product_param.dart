import 'package:flutter_riverpod/flutter_riverpod.dart';

var productSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasProductsProvider = StateProvider.autoDispose<bool>((ref) => true);
var hasFavoriteProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
