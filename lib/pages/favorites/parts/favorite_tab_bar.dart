import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/providers/pages/favorites.dart';

class FavoritePageTabBar extends ConsumerWidget {
  const FavoritePageTabBar({
    super.key,
    required this.text,
    required this.index,
  });

  final String text;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeFavorite = ref.watch(activeFavoriteProvider);

    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (activeFavorite == index)
            Divider(
              color: elevatedButtonColor,
              height: 10,
              indent: 10,
              endIndent: 10,
            )
          else
            const SizedBox(height: 10)
        ],
      ),
    );
  }
}
