import 'package:flutter/material.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/profile.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: elevatedButtonColor.withOpacity(.8),
      child: ListTile(
        onTap: () => showLanguageMethod(context),
        leading: const Icon(Icons.translate, color: Colors.white),
        title: const Text('Dil', style: TextStyle(color: Colors.white)),
        trailing: const Text(
          'Turkmen',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
