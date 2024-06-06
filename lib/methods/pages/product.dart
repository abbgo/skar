import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';

Row productPriceMethod(num? price, num? oldPrice) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$price man",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.red,
        ),
      ),
      const SizedBox(width: 10),
      oldPrice != 0
          ? Text(
              "$oldPrice man",
              style: const TextStyle(
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
              ),
            )
          : const SizedBox(),
    ],
  );
}

Padding titleMethod(
  BuildContext context,
  String text,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: elevatedButtonColor.withOpacity(0.1)),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    ),
  );
}
