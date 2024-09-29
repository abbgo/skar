import 'package:flutter/material.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({
    super.key,
    required this.isBrand,
    required this.top,
    required this.left,
    required this.size,
  });

  final bool isBrand;
  final double top, left, size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2,
      left: 2,
      child: isBrand
          ? Image.asset('assets/images/brand.png', height: 20, width: 20)
          : const SizedBox(),
    );
  }
}
