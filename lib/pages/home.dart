import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/pages/statute.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFirstTime = ref.watch(isFirstTimeProvider);

    return isFirstTime
        ? const StatutePage()
        : const BottomNavigationPage(isMapPage: true, shopID: "");
  }
}
