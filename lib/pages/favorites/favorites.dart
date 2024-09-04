import 'package:flutter/material.dart';
import 'package:skar/pages/favorites/parts/products.dart';
import 'package:skar/pages/favorites/parts/shops.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 2,
          tabs: [
            Text(
              lang.myFavoriteShops,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              lang.myFavoriteProducts,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
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
