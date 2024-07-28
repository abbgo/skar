import 'package:flutter/material.dart';

class ChildShopsBody extends StatelessWidget {
  const ChildShopsBody({super.key, required this.parentShopID});

  final String parentShopID;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Child shops'),
    );
  }
}
