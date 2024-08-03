import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class FeedbackPage extends ConsumerWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isLightBrightness ? Colors.white : dialogColorDarkTheme,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const Wrap(children: []),
    );
  }
}
