import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/statute.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/pages/statute.dart';

class StatutePage extends ConsumerWidget {
  const StatutePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool isChecked = ref.watch(checkBoxProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 15),
        child: Column(
          children: [
            Center(
              child: Text(
                lang.termsOfService,
                style: const TextStyle(
                  color: Color(0xFF3E3E40),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ListView(
                    children: [
                      columnOfListviewMethod(
                          lang.statuteTitle1, lang.statuteDescription1),
                      columnOfListviewMethod(
                          lang.statuteTitle2, lang.statuteDescription2),
                      columnOfListviewMethod(
                          lang.statuteTitle3, lang.statuteDescription3),
                      columnOfListviewMethod(
                          lang.statuteTitle4, lang.statuteDescription4),
                      columnOfListviewMethod(
                          lang.statuteTitle5, lang.statuteDescription5),
                      columnOfListviewMethod(
                          lang.statuteTitle6, lang.statuteDescription6),
                      columnOfListviewMethod(
                          lang.statuteTitle7, lang.statuteDescription7),
                    ],
                  ),
                  containerMethod(100, context),
                  containerMethod(75, context),
                  containerMethod(50, context),
                  containerMethod(25, context),
                ],
              ),
            ),
            GestureDetector(
              onTap: () =>
                  ref.read(checkBoxProvider.notifier).state = !isChecked,
              child: Container(
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 1.0,
                      child: SizedBox(
                        width: 20,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            ref.read(checkBoxProvider.notifier).state =
                                !isChecked;
                          },
                          activeColor: elevatedButtonColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      lang.acceptStatute,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: screenProperties(context).isPhone
                  ? screenProperties(context).width
                  : screenProperties(context).width * 0.3,
              child: ElevatedButton(
                onPressed: () {
                  if (isChecked) {
                    ref.read(isFirstTimeProvider.notifier).update(false);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationPage(
                          shopID: "",
                          isMapPage: true,
                        ),
                      ),
                    );
                  } else {
                    warningShowGeneralDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
            ),
          ],
        ),
      ),
    );
  }
}
