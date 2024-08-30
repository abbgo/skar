import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class IconBody extends ConsumerWidget {
  const IconBody({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return SizedBox(
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
