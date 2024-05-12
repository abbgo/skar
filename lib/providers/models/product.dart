import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/product.dart';
import 'package:skar/services/product.dart';

final productApiProvider = Provider<ProductService>((ref) => ProductService());

var fetchProductsProvider =
    FutureProvider.family<List<Product>, ProductParams>((ref, params) {
  return ref.read(productApiProvider).fetchProducts(
      "products", 10, params.page, params.categories, params.shopID, "");
});
