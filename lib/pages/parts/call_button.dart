import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/styles/colors.dart';

class CallButton extends ConsumerWidget {
  const CallButton({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return Container(
      alignment: Alignment.topCenter,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: isLightBrightness ? null : scaffoldColorDarkTheme,
        ),
        onPressed: () => showCallBottomSheet(context, shop.phones!),
        icon: const Icon(Icons.call, color: Color(0xFF4AC76D), size: 20),
      ),
    );
  }
}
