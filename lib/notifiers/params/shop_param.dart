import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/services/shop.dart';

class ShopParamsNotifier extends StateNotifier<ShopParams> {
  ShopParamsNotifier()
      : super(
          const ShopParams(
            latitude: 0,
            longitude: 0,
            kilometer: 2,
          ),
        );

  Future<void> changeForMap(ShopParams params) async {
    state = state.copyWith(
      latitude: params.latitude,
      longitude: params.longitude,
      kilometer: params.kilometer,
    );
  }
}
