import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/parts/bottom_navigation.dart';
import 'package:skar/pages/favorites/favorites.dart';
import 'package:skar/pages/map/map.dart';
import 'package:skar/pages/search.dart';
import 'package:skar/pages/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/models/favorite.dart';

class BottomNavigationPage extends ConsumerWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int selectedIndex = ref.watch(selectedBottomIndexProvider);

    List<Widget> pages = [
      const MapPage(),
      const FavoritesPage(),
      const SearchPage(),
      const SettingPage(),
    ];

    if (selectedIndex == 1) {
      ref.invalidate(fetchFavoriteShopsProvider);
      ref.invalidate(fetchFavoriteProductsProvider);
    }

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
          ),
          bottomNavigationBarItemMethod(
            lang.myFavorites,
            const Icon(Icons.favorite_border, size: 24),
          ),
          bottomNavigationBarItemMethod(
            lang.search,
            Image.asset(
              "assets/icons/search.png",
              color: elevatedButtonColor,
              height: 24,
            ),
          ),
          bottomNavigationBarItemMethod(
            lang.settings,
            Image.asset(
              "assets/icons/setting.png",
              color: elevatedButtonColor,
              height: 22,
            ),
          ),
        ],
        elevation: 0,
        selectedItemColor: elevatedButtonColor,
        unselectedItemColor: elevatedButtonColor,
        currentIndex: selectedIndex,
        onTap: (value) {
          ref.read(selectedBottomIndexProvider.notifier).state = value;
        },
      ),
    );
  }
}
