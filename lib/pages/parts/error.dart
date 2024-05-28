import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/helpers/static_data.dart';

class SomeThingWrong extends StatelessWidget {
  const SomeThingWrong({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.report,
            color: elevatedButtonColor,
            size: 80,
          ),
          Text(
            lang.wentWrong,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.manage_search,
            color: elevatedButtonColor,
            size: 80,
          ),
          Text(
            lang.noResult,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
