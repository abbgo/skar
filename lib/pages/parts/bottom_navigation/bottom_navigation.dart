import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/parts/bottom_navigation/parts/bottom_navigation_bar.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/pages/favorites/favorites.dart';
import 'package:skar/pages/map/map.dart';
import 'package:skar/pages/search_product/search_product.dart';
import 'package:skar/pages/profile/profile.dart';

class BottomNavigationPage extends ConsumerWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      bottomNavigationBar:
          BottomNavigationBarPart(selectedIndex: selectedIndex),
    );
  }
}
