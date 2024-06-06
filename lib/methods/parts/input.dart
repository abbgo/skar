import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

OutlineInputBorder inputBorder(BuildContext context) {
  bool isLightBrightness = screenProperties(context).isLightBrightness;

  return OutlineInputBorder(
    borderSide: BorderSide(
      color: isLightBrightness ? elevatedButtonColor : Colors.white,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
}
