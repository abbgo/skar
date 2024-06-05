import 'package:flutter/material.dart';
import 'package:skar/methods/pages/statute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatuteContent extends StatelessWidget {
  const StatuteContent({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Expanded(
      child: ListView(
        children: [
          columnOfListviewMethod(lang.statuteTitle1, lang.statuteDescription1),
          columnOfListviewMethod(lang.statuteTitle2, lang.statuteDescription2),
          columnOfListviewMethod(lang.statuteTitle3, lang.statuteDescription3),
          columnOfListviewMethod(lang.statuteTitle4, lang.statuteDescription4),
          columnOfListviewMethod(lang.statuteTitle5, lang.statuteDescription5),
          columnOfListviewMethod(lang.statuteTitle6, lang.statuteDescription6),
          columnOfListviewMethod(lang.statuteTitle7, lang.statuteDescription7),
        ],
      ),
    );
  }
}
