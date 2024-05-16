import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/product.dart';
import 'package:skar/services/product.dart';

final productApiProvider = Provider<ProductService>((ref) => ProductService());

var fetchProductsProvider = FutureProvider.family<ResultProduct, ProductParams>(
  (ref, params) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      List<Product> products = await ref.read(productApiProvider).fetchProducts(
            params.api,
            params.limit,
            params.page,
            params.categories,
            params.shopID,
            params.productID,
          );

      result = ResultProduct(error: '', products: products);
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }

    return result;
  },
);

var fetchProductProvider = FutureProvider.family<ResultProduct, String>(
  (ref, productID) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      Product product =
          await ref.read(productApiProvider).fetchProduct(productID);
      result = ResultProduct(error: '', product: product);
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }
    return result;
  },
);
