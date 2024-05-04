import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/services/shop.dart';

final apiProvider = Provider<ShopService>((ref) => ShopService());
final shopDataProvider = FutureProvider<List<Shop>>((ref) {
  return ref.read(apiProvider).fetchShopsForMap('shops/map');
});
