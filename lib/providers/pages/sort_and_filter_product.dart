import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortProductPriceProvider = StateProvider<String>((ref) => '');
final priceRangeProvider = StateProvider.autoDispose<String>((ref) => '0-0');
