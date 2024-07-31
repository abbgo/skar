import 'package:flutter/material.dart';

class DecreaseZoomButton extends StatelessWidget {
  const DecreaseZoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
