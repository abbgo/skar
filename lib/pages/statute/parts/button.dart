import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/statute.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/pages/statute.dart';

class StatuteButton extends ConsumerWidget {
  const StatuteButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool isChecked = ref.watch(checkBoxProvider);

    return Container(
      color: Colors.white,
      width: screenProperties(context).width,
      child: ElevatedButton(
        onPressed: () {
          if (isChecked) {
            ref.read(isFirstTimeProvider.notifier).update(false);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const BottomNavigationPage(shopID: "", isMapPage: true),
              ),
            );
          } else {
            warningShowGeneralDialog(context);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            lang.next,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
