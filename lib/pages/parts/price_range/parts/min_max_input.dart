import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/parts/input.dart';
import 'package:skar/styles/colors.dart';

class MinMaxInput extends ConsumerWidget {
  const MinMaxInput(
      {super.key, required this.controller, required this.labelText});

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: elevatedButtonColor,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: inputBorder(context, ref),
                border: inputBorder(context, ref),
                labelText: ' $labelText ',
                labelStyle: TextStyle(
                  color: isLightBrightness ? elevatedButtonColor : Colors.white,
                ),
              ),
            ),
          ),
          const Text(' TMT'),
        ],
      ),
    );
  }
}
