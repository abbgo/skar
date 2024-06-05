import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/parts/bottom_navigation.dart';
import 'package:skar/pages/favorites/favorites.dart';
import 'package:skar/pages/map/map.dart';
import 'package:skar/pages/search_product/search_product.dart';
import 'package:skar/pages/profile/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationPage extends ConsumerWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    int selectedIndex = ref.watch(selectedBottomIndexProvider);

    List<Widget> pages = [
      const MapPage(),
      const FavoritesPage(),
      const SearchProductPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          bottomNavigationBarItemMethod(
            lang.map,
            const Icon(Icons.travel_explore, size: 24),
            brightness == Brightness.light ? Colors.white : Colors.black,
          ),
          bottomNavigationBarItemMethod(
            lang.myFavorites,
            const Icon(Icons.favorite_border, size: 24),
            brightness == Brightness.light ? Colors.white : Colors.black,
          ),
          bottomNavigationBarItemMethod(
            lang.search,
            Image.asset(
              "assets/icons/search.png",
              color: brightness == Brightness.light
                  ? elevatedButtonColor
                  : Colors.white,
              height: 24,
            ),
            brightness == Brightness.light ? Colors.white : Colors.black,
          ),
          bottomNavigationBarItemMethod(
            lang.settings,
            Image.asset(
              "assets/icons/setting.png",
              color: brightness == Brightness.light
                  ? elevatedButtonColor
                  : Colors.white,
              height: 22,
            ),
            brightness == Brightness.light ? Colors.white : Colors.black,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          ref.read(selectedBottomIndexProvider.notifier).state = value;
        },
      ),
    );
  }
}
