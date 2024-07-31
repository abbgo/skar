import 'package:flutter/material.dart';

class IncreaseZoomButton extends StatelessWidget {
  const IncreaseZoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
