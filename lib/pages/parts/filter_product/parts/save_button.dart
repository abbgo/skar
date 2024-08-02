import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: screenProperties(context).width,
      child: ElevatedButton(onPressed: () {}, child: const Text('Sayla')),
    );
  }
}
