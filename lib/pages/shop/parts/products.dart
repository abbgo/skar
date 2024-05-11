import 'package:flutter/material.dart';

class ShopProducts extends StatelessWidget {
  const ShopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 8,
        mainAxisExtent: screenSize.height * 0.35,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
