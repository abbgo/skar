import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

late SharedPreferences prefs;

final isFirstTimeProvider = createPrefProvider<bool>(
  prefs: (_) => prefs,
  prefKey: "is_first_time",
  defaultValue: true,
);

final isTmProvider = createPrefProvider<bool>(
  prefs: (_) => prefs,
  prefKey: "is_tm",
  defaultValue: true,
);

final selectedBottomIndexProvider = createPrefProvider<int>(
  prefs: (_) => prefs,
  prefKey: "bottom_index",
  defaultValue: 0,
);
