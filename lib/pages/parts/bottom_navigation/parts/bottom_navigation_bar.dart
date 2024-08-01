import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/parts/bottom_navigation.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationBarPart extends ConsumerWidget {
  const BottomNavigationBarPart({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool isLightBrightness = isLightTheme(context, ref);

    return BottomNavigationBar(
      items: [
        bottomNavigationBarItemMethod(
          lang.map,
          const Icon(Icons.travel_explore, size: 24),
          isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
        ),
        bottomNavigationBarItemMethod(
          lang.myFavorites,
          const Icon(Icons.favorite_border, size: 24),
          isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
        ),
        bottomNavigationBarItemMethod(
          lang.products,
          const Icon(Icons.shopping_bag_outlined, size: 24),
          isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
        ),
        bottomNavigationBarItemMethod(
          lang.settings,
          Image.asset(
            "assets/icons/setting.png",
            color: isLightBrightness ? elevatedButtonColor : Colors.white,
            height: 22,
          ),
          isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (value) {
        ref.read(selectedBottomIndexProvider.notifier).state = value;
      },
    );
  }
}
