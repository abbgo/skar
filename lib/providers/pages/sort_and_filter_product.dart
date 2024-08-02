import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortProductPriceProvider = StateProvider<String>((ref) => '');
final minPriceProvider = StateProvider.autoDispose<double>((ref) => 0);
final maxPriceProvider = StateProvider.autoDispose<double>((ref) => 0);
