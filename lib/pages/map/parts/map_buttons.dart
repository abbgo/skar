import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/map/parts/map_type_button.dart';
import 'package:skar/pages/map/parts/search_shop_button.dart';

class MapButtons extends ConsumerWidget {
  const MapButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: screenProperties(context).topSafeArea + 5,
      right: 10,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchShopButton(),
          MapTypeButton(),
        ],
      ),
    );
  }
}
