import 'package:flutter/material.dart';
import 'package:skar/pages/profile/parts/language.dart';
import 'package:skar/pages/profile/parts/theme_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          LanguagePage(),
          ThemePage(),
        ],
      ),
    );
  }
}
