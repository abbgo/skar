import 'package:flutter/material.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';

class ShopProducts extends StatelessWidget {
  const ShopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenProperties screenSize = screenProperties(context);

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 8,
        mainAxisExtent: screenSize.height * 0.35,
      ),
      itemBuilder: (context, index) {},
    );
  }
}
