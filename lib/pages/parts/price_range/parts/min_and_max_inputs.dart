import 'package:flutter/material.dart';

class MinAndMaxInputs extends StatelessWidget {
  const MinAndMaxInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: TextField(),
        ),
        Expanded(
          child: TextField(),
        ),
      ],
    );
  }
}
