import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortProductPriceProvider = StateProvider<String>((ref) => '');
final searchProductPriceRangeProvider = StateProvider<String>((ref) => '0-0');
final priceRangeProvider = StateProvider<String>((ref) => '0-0');
