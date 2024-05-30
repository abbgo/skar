import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/favorites/parts/products.dart';
import 'package:skar/pages/favorites/parts/shops.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with TickerProviderStateMixin {
  final List<Widget> _pages = [const FavoriteShops(), const FavoriteProducts()];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              labelPadding: const EdgeInsets.only(bottom: 10),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              labelColor: elevatedButtonColor,
              indicatorColor: elevatedButtonColor,
              controller: _tabController,
              indicatorWeight: 2,
              dividerColor: Colors.white,
              overlayColor: WidgetStateColor.transparent,
              tabs: const [
                Text('Dukan'),
                Text('Haryt'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: _pages,
          ),
        );
      },
    );
  }
}
