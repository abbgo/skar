import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortProductPriceProvider = StateProvider<String>((ref) => '');
final minPriceProvider = StateProvider.autoDispose<String>((ref) => '');
final maxPriceProvider = StateProvider.autoDispose<String>((ref) => '');
