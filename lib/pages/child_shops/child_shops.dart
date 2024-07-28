import 'package:flutter/material.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';

class ChildShopsPage extends StatelessWidget {
  const ChildShopsPage({super.key, required this.parentShopID});

  final String parentShopID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: SearchField(
          onPressed: onPressed,
          onSubmitted: onSubmitted,
          autofocus: autofocus,
          hintText: hintText,
          initText: initText,
          ref: ref,
        ),
      ),
      body: Center(
        child: Text('Child shops'),
      ),
    );
  }
}
