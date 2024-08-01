import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/pages/statute.dart';
import 'package:skar/pages/parts/bottom_navigation/bottom_navigation.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/pages/statute.dart';

class StatuteButton extends StatelessWidget {
  const StatuteButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return SizedBox(
      width: screenProperties(context).width,
      child: Consumer(
        builder: (context, ref, child) {
          bool isChecked = ref.watch(checkBoxProvider);

          return ElevatedButton(
            onPressed: () {
              if (isChecked) {
                ref.read(isFirstTimeProvider.notifier).update(false);
                goToPage(context, const BottomNavigationPage(), true);
              } else {
                warningShowGeneralDialog(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(lang.next),
            ),
          );
        },
      ),
    );
  }
}
