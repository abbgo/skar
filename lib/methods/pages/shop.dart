import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/services.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

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
  bool isLightBrightness = screenProperties(context).isLightBrightness;

  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isLightBrightness ? Colors.white : dialogColorDarkTheme,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: shopPhones
            .map(
              (e) => ListTile(
                title: Text(
                  e.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: e.toString()));
                      },
                      icon: Icon(
                        Icons.copy_all,
                        color: isLightBrightness
                            ? elevatedButtonColor
                            : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber(e.toString());
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    ),
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
