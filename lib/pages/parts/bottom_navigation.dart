import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/parts/bottom_navigation.dart';
import 'package:skar/pages/favorites.dart';
import 'package:skar/pages/map/map.dart';
import 'package:skar/pages/search.dart';
import 'package:skar/pages/setting.dart';
import 'package:skar/pages/shop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({
    super.key,
    required this.isMapPage,
    required this.shopID,
  });

  final bool isMapPage;
  final String shopID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    List<Widget> pages = [
      isMapPage ? MapPage() : ShopPage(shopID: shopID, isTM: true),
      const LikesPage(),
      const SearchPage(),
      const SettingPage(),
    ];

    return Consumer(
      builder: (context, ref, child) {
        int selectedIndex = ref.watch(selectedBottomIndexProvider);

        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: pages,
          ),
          bottomNavigationBar: SizedBox(
            child: BottomNavigationBar(
              items: [
                bottomNavigationBarItemMethod(
                    lang.map, const Icon(Icons.travel_explore, size: 24)),
                bottomNavigationBarItemMethod(lang.myFavorites,
                    const Icon(Icons.favorite_border, size: 24)),
                bottomNavigationBarItemMethod(
                    lang.search,
                    Image.asset(
                      "assets/icons/search.png",
                      color: elevatedButtonColor,
                      height: 24,
                    )),
                bottomNavigationBarItemMethod(
                    lang.settings,
                    Image.asset(
                      "assets/icons/setting.png",
                      color: elevatedButtonColor,
                      height: 22,
                    )),
              ],
              elevation: 0,
              selectedItemColor: elevatedButtonColor,
              unselectedItemColor: elevatedButtonColor,
              currentIndex: selectedIndex,
              onTap: (value) {
                ref.read(selectedBottomIndexProvider.notifier).update(value);
              },
            ),
          ),
        );
      },
    );
  }
}
