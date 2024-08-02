import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/parts/input.dart';

class MinMaxInput extends ConsumerWidget {
  const MinMaxInput(
      {super.key, required this.controller, required this.labelText});

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: inputBorder(context, ref),
                labelText: ' $labelText ',
              ),
            ),
          ),
          Text(' ${lang.man}'),
        ],
      ),
    );
  }
}
