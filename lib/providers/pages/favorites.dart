import 'package:flutter_riverpod/flutter_riverpod.dart';

var activeFavoriteProvider = StateProvider.autoDispose<int>((ref) => 0);
