import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/product.dart';
import 'package:skar/services/product.dart';

final productApiProvider = Provider<ProductService>((ref) => ProductService());

var fetchProductsProvider = FutureProvider.family<List<Product>, ProductParams>(
  (ref, params) {
    return ref.read(productApiProvider).fetchProducts(
          params.api,
          params.limit,
          params.page,
          params.categories,
          params.shopID,
          params.productID,
        );
  },
);

var fetchProductProvider = FutureProvider.family<Product, String>(
  (ref, productID) => ref.read(productApiProvider).fetchProduct(productID),
);
