import 'package:flutter/material.dart';

class GenderCheckboxListTile extends StatelessWidget {
  const GenderCheckboxListTile(
      {super.key, required this.title, required this.gender});

  final int gender;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      value: false,
      onChanged: (value) {},
    );
  }
}
