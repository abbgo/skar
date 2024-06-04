import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

late SharedPreferences prefs;

final isFirstTimeProvider = createPrefProvider<bool>(
  prefs: (_) => prefs,
  prefKey: "is_first_time",
  defaultValue: true,
);

final langProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "lang",
  defaultValue: 'tr',
);

var selectedBottomIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
