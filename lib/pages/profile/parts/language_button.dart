import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key, required this.text, required this.lang});

  final String text;
  final String lang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String language = ref.read(langProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:
              language == lang ? elevatedButtonColor : Colors.white,
          elevation: 3,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: language == lang ? Colors.white : elevatedButtonColor,
          ),
        ),
      ),
    );
  }
}
