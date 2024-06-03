import 'package:flutter_riverpod/flutter_riverpod.dart';

var shopProductSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasShopProductsProvider = StateProvider.autoDispose<bool>((ref) => true);

var hasFavoriteProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);

var productSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasProductsProvider = StateProvider.autoDispose<bool>((ref) => true);
