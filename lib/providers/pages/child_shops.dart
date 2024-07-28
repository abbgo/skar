import 'package:flutter_riverpod/flutter_riverpod.dart';

var childShopsSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasChildShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
