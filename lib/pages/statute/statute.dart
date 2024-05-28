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
      backgroundColor: Colors.white,
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
            const StatuteContent(),
            const StatuteCheckBox(),
            const StatuteButton(),
          ],
        ),
      ),
    );
  }
}
