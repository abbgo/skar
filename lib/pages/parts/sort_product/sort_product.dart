import 'package:flutter/material.dart';
import 'package:skar/pages/parts/sort_product/sort_product_card.dart';

class SortProduct extends StatelessWidget {
  const SortProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          SortProductCard(text: 'Baslangyc yagdayy', value: ''),
          SortProductCard(text: 'Arzandan-Gymmada', value: '0-1'),
          SortProductCard(text: 'Gymmatdan-Arzana', value: '1-0'),
        ],
      ),
    );
  }
}
