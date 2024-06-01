import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TabBarView(
          controller: _tabController,
          children: const [FavoriteShops(), FavoriteProducts()],
        ),
      ),
    );
  }
}
