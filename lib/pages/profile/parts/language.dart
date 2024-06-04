import 'package:flutter/material.dart';
import 'package:skar/helpers/static_data.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: elevatedButtonColor.withOpacity(.8),
      child: const ListTile(
        leading: Icon(Icons.translate, color: Colors.white),
        title: Text('Dil', style: TextStyle(color: Colors.white)),
        trailing: Text('Turkmen',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
