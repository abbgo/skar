import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/theme.dart';

final themeProvider = StateProvider.autoDispose<int>((ref) => ThemeType.system);
