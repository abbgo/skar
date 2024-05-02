import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/pages/statute.dart';
import 'package:skar/providers/setting.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var setting = ref.watch(settingProvider);

    return setting.isFirstTime == 1
        ? const StatutePage()
        // : BottomNavigationPage(isMapPage: true, shopID: "", isTM: setting.isTM);
        : BottomNavigationPage(isMapPage: true, shopID: "", isTM: true);
  }
}
