import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/notifiers/params/shop_param.dart';
import 'package:skar/services/shop.dart';

var shopParamProvider =
    StateNotifierProvider.autoDispose<ShopParamsNotifier, ShopParams>(
  (ref) => ShopParamsNotifier(),
);

var shopSearchProvider = StateProvider<String>((ref) => '');
var hasShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
var hasFavoriteShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
