import 'package:flutter/material.dart';
import 'package:skar/pages/profile/parts/language.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: const [
          LanguagePage(),
        ],
      ),
    );
  }
}
