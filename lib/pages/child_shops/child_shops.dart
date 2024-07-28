import 'package:flutter/material.dart';

class ChildShopsPage extends StatelessWidget {
  const ChildShopsPage({super.key, required this.parentShopID});

  final String parentShopID;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Text('Child shops'),
      ),
    );
  }
}
