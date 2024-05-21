import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/services/shop.dart';

class ShopParamsNotifier extends StateNotifier<ShopParams> {
  ShopParamsNotifier()
      : super(
          const ShopParams(
            latitude: 0,
            longitude: 0,
            kilometer: 2, /* search: '' */
          ),
        );

  Future<void> change(ShopParams params) async {
    state = params;
  }

  Future<void> changeSearch(String search) async {
    state = state.copyWith(search: search);
  }
}

var shopParamProvider =
    StateNotifierProvider.autoDispose<ShopParamsNotifier, ShopParams>(
  (ref) => ShopParamsNotifier(),
);
