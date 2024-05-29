import 'package:flutter/material.dart';

class ProductFavoriteButton extends StatelessWidget {
  const ProductFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Icon(Icons.favorite_border, size: 16),
          ),
        ),
      ),
    );
  }
}
