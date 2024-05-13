import 'package:flutter_riverpod/flutter_riverpod.dart';

var activeImageColorProvider = StateProvider.autoDispose<int>((ref) => 0);
var selectedProductColorProvider = StateProvider.autoDispose<int>((ref) => 0);
