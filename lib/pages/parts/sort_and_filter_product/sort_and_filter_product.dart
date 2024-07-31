import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class SortAndFilterProduct extends ConsumerWidget {
  const SortAndFilterProduct({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return GestureDetector(
      onTap: onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: isLightBrightness ? elevatedButtonColor : Colors.white,
          ),
          color: isLightBrightness ? Colors.white : dialogColorDarkTheme,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isLightBrightness ? elevatedButtonColor : null,
            ),
            Text(
              text,
              style: TextStyle(
                color: isLightBrightness ? elevatedButtonColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
