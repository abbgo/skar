import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/favorites/parts/favorite_tab_bar.dart';

class LikesPage extends StatelessWidget {
  LikesPage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenProperties(context).topSafeArea + 10),
      child: Column(
        children: [
          const Row(
            children: [
              FavoritePageTabBar(text: 'Dukan'),
              FavoritePageTabBar(text: 'Haryt'),
            ],
          ),
          PageView.builder(
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {},
            // onPageChanged: (value) {
            //   ref.read(activeImageColorProvider.notifier).state = value;
            // },
            // itemCount: productColor.images!.length,
            // itemBuilder: (context, index) {
            //   return showCachImageMethod(productColor.images![index]);
            // },
          ),
        ],
      ),
    );
  }
}
