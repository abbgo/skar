import 'package:flutter/material.dart';

class FavoritePageTabBar extends StatelessWidget {
  const FavoritePageTabBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(text),
      ),
    );
  }
}
