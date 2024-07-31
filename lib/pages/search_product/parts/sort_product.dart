import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';

class SortProduct extends StatelessWidget {
  const SortProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: elevatedButtonColor),
        color: Colors.white,
      ),
      child: const Row(
        children: [
          Icon(Icons.swap_vert, size: 20),
          Text('Sort'),
        ],
      ),
    );
  }
}
