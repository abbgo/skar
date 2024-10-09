import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/filter_genders/filter_genders.dart';
import 'package:skar/styles/colors.dart';

class ShopFilterButton extends ConsumerWidget {
  const ShopFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      onPressed: () => Navigator.push(
        context,
        CustomPageRoute(
          child: FilterGendersPage(),
          direction: AxisDirection.left,
        ),
      ),
      icon: Icon(
        Icons.filter_alt_outlined,
        color: isLightBrightness ? elevatedButtonColor : Colors.white,
        size: 22,
      ),
    );
  }
}
