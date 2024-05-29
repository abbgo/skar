import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/favorites/parts/favorite_tab_bar.dart';
import 'package:skar/pages/favorites/parts/products.dart';
import 'package:skar/pages/favorites/parts/shops.dart';
import 'package:skar/providers/pages/favorites.dart';

class FavoritesPage extends ConsumerWidget {
  FavoritesPage({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [const FavoriteShops(), const FavoriteProducts()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: screenProperties(context).topSafeArea + 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FavoritePageTabBar(text: 'Dukan'),
              FavoritePageTabBar(text: 'Haryt'),
            ],
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                ref.read(activeFavoriteProvider.notifier).state = value;
              },
              controller: _pageController,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
