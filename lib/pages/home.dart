import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/internet_connection.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/pages/statute/statute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFirstTime = ref.watch(isFirstTimeProvider);
    var lang = AppLocalizations.of(context)!;

    ref.listen(
      connectivityStatusProviders,
      (previous, next) {
        if (next == ConnectivityStatus.isDisonnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                lang.noIntConn,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );

    return isFirstTime
        ? const StatutePage()
        : const BottomNavigationPage(isMapPage: true, shopID: "");
  }
}
