import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/product.dart';
import 'package:skar/styles/colors.dart';

class ComplaintButton extends ConsumerWidget {
  const ComplaintButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return IconButton(
      onPressed: () => showFeedbackBottomSheet(context, productID),
      icon: Icon(
        Icons.feedback_outlined,
        color: isLightBrightness ? elevatedButtonColor : Colors.white,
      ),
    );
  }
}
