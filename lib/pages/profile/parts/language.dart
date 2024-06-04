import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/profile.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: elevatedButtonColor.withOpacity(.8),
      child: Consumer(
        builder: (context, ref, child) {
          String language = ref.watch(langProvider);

          return ListTile(
            onTap: () => showLanguageMethod(context),
            leading: const Icon(Icons.translate, color: Colors.white),
            title: const Text('Dil', style: TextStyle(color: Colors.white)),
            trailing: Text(
              language == 'tr' ? 'Turkmen' : 'Русский',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
