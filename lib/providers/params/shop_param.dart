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

  Future<void> changeForMap(ShopParams params) async {
    state = state.copyWith(
      latitude: params.latitude,
      longitude: params.longitude,
      kilometer: params.kilometer,
    );
  }

  // Future<void> changeForShop(ShopParams params) async {
  //   state = state.copyWith(
  //     search: params.search,
  //     isBrend: params.isBrend,
  //     page: params.page,
  //   );
  // }
}

var shopParamProvider =
    StateNotifierProvider.autoDispose<ShopParamsNotifier, ShopParams>(
  (ref) => ShopParamsNotifier(),
);
