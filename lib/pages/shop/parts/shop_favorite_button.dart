import 'package:flutter/material.dart';
import 'package:skar/database/functions/favorite.dart';
import 'package:skar/models/favorite.dart';
import 'package:skar/models/favorite_type.dart';

class ShopFavoriteButton extends StatelessWidget {
  const ShopFavoriteButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Favorite favorite = Favorite(id: shopID, type: FavoriteType.shop);
        await createFavorite(favorite);
      },
      icon: const Icon(Icons.favorite_border, color: Colors.black),
    );
  }
}
