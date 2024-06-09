import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

OutlineInputBorder inputBorder(BuildContext context, WidgetRef ref) {
  bool isLightBrightness = isLightTheme(context, ref);

  return OutlineInputBorder(
    borderSide: BorderSide(
      color: isLightBrightness ? elevatedButtonColor : Colors.white,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
}
