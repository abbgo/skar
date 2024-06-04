import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key, required this.text, required this.lang});

  final String text;
  final String lang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isTm = ref.read(isTmProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
