import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/styles/colors.dart';

class SelectShopBottomSheet extends ConsumerWidget {
  const SelectShopBottomSheet({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isLightBrightness ? Colors.white : dialogColorDarkTheme,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const Wrap(
        children: [
          Text('Dukan saylan'),
        ],
      ),
    );
  }
}
