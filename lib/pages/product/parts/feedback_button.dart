import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class FeedbackButton extends ConsumerWidget {
  const FeedbackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.feedback_outlined,
        color: isLightBrightness ? elevatedButtonColor : Colors.white,
      ),
    );
  }
}
