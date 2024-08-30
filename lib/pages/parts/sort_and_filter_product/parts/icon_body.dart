import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class IconBody extends ConsumerWidget {
  const IconBody({
    super.key,
    required this.text,
    required this.icon,
    required this.forSort,
  });

  final String text;
  final IconData icon;
  final bool forSort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: forSort
            ? Border(
                right: BorderSide(
                color: isLightBrightness ? elevatedButtonColor : Colors.white,
                width: 0,
              ))
            : Border(
                left: BorderSide(
                color: isLightBrightness ? elevatedButtonColor : Colors.white,
                width: 0,
              )),
      ),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: isLightBrightness ? elevatedButtonColor : null,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: isLightBrightness ? elevatedButtonColor : null,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
