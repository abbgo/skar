import 'package:flutter/material.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/parts/bottom_navigation.dart';
import 'package:skar/pages/favorites.dart';
import 'package:skar/pages/map.dart';
import 'package:skar/pages/search.dart';
import 'package:skar/pages/setting.dart';
import 'package:skar/pages/shop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.isMapPage,
    required this.shopID,
    required this.isTM,
  });

  final bool isMapPage;
  final String shopID;
  final bool isTM;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  // VARIABLES -----------------------------------------------------------------
  List<Widget> pages = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      pages.addAll([
        widget.isMapPage
            ? MapPage(isTM: widget.isTM)
            : ShopPage(shopID: widget.shopID, isTM: widget.isTM),
        const LikesPage(),
        const SearchPage(),
        const SettingPage(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

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
            bottomNavigationBarItemMethod(
                lang.myFavorites, const Icon(Icons.favorite_border, size: 24)),
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
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
