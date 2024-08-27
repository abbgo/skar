import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/product.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:skar/services/product.dart';

final productApiProvider = Provider<ProductService>((ref) => ProductService());

var fetchProductsProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, params) async {
    ResultProduct result = ResultProduct.defaultResult();
    String minPrice = '';
    String maxPrice = '';

    String search = params.shopID != ''
        ? ref.watch(shopProductSearchProvider)
        : ref.watch(productSearchProvider);

    bool isTM = ref.read(langProvider) == 'tr';

    String sortProductPrice = params.shopID == ''
        ? ref.watch(sortProductPriceProvider)
        : ref.watch(sortSearchProductPriceProvider);

    String priceRange = params.shopID == ''
        ? ref.read(searchProductPriceRangeProvider)
        : ref.read(priceRangeProvider);
    List<String> prices = priceRange.split('-');
    minPrice = prices[0];
    maxPrice = prices[1];

    try {
      List<Product> products = await ref.read(productApiProvider).fetchProducts(
            params.api,
            params.limit,
            params.page,
            params.categories,
            params.shopID,
            params.productID,
            search,
            isTM ? 'tm' : 'ru',
            sortProductPrice,
            minPrice,
            maxPrice,
          );

      if (params.api == 'products') {
        if ((params.shopID != '' && params.page == 1) ||
            (search != '' && params.page == 1)) {
          ref.read(hasShopProductsProvider.notifier).state =
              products.isNotEmpty;
        } else {
          if ((search != '' && params.page == 1) ||
              (maxPrice != '0' && params.page == 1)) {
            ref.read(hasProductsProvider.notifier).state = products.isNotEmpty;
          }
        }
      }

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
