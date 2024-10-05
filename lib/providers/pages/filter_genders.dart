import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/notifiers/pages/filter_genders.dart';

var productGendersProvider =
    StateNotifierProvider<SelectedProductGendersNotifier, List<dynamic>>(
  (ref) => SelectedProductGendersNotifier(),
);
