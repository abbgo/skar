import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/styles/colors.dart';

class MapTypeButton extends ConsumerWidget {
  const MapTypeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      onPressed: () async {
        await ref.read(markersProvider.notifier).removeAllMarkers();
        ref.read(isHybridMapProvider.notifier).change();
      },
      icon: Icon(
        Icons.layers,
        color: isLightBrightness ? elevatedButtonColor : Colors.white,
        size: 22,
      ),
    );
  }
}
