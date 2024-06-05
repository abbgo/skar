import 'package:flutter/material.dart';
import 'package:skar/pages/statute/parts/button.dart';
import 'package:skar/pages/statute/parts/check_box.dart';
import 'package:skar/pages/statute/parts/content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatutePage extends StatelessWidget {
  const StatutePage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(lang.termsOfService)),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 15),
        child: Column(
          children: [
            SizedBox(height: 8),
            StatuteContent(),
            StatuteCheckBox(),
            StatuteButton(),
          ],
        ),
      ),
    );
  }
}
