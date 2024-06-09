import 'package:flutter/material.dart';
import 'package:skar/pages/parts/call_bottom_sheet.dart';

Padding shopCardTextMethod(
  String text,
  double fontSize,
  TextDecoration decoration,
  FontWeight fontWeight,
  Color? color,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        color: color,
      ),
      maxLines: 2,
    ),
  );
}

showCallBottomSheet(BuildContext context, List<dynamic> shopPhones) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => CallBottomSheet(shopPhones: shopPhones),
  );
}

Text shopTextMethod(double fontSize, String text, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    textAlign: TextAlign.center,
    maxLines: 2,
  );
}
