import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/internet_connection.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/pages/statute/statute.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFirstTime = ref.watch(isFirstTimeProvider);

    ref.listen(
      connectivityStatusProviders,
      (previous, next) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next == ConnectivityStatus.isConnected
                  ? 'Is Connected to Internet'
                  : 'Is Disconnected from Internet',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: next == ConnectivityStatus.isConnected
                ? Colors.green
                : Colors.red,
          ),
        );
      },
    );

    return isFirstTime
        ? const StatutePage()
        : const BottomNavigationPage(isMapPage: true, shopID: "");
  }
}
