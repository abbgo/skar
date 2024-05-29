import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/favorites/parts/favorite_tab_bar.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenProperties(context).topSafeArea + 10),
      child: const Column(
        children: [
          Row(
            children: [
              FavoritePageTabBar(text: 'Dukan'),
              FavoritePageTabBar(text: 'Haryt'),
            ],
          ),
        ],
      ),
    );
  }
}
