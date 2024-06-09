import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                bool isLightBrightness = isLightTheme(context, ref);
                return Image.asset(
                  isLightBrightness
                      ? "assets/images/empty_cart.jpg"
                      : "assets/images/empty_cart_dark.jpg",
                );
              },
            ),
            const SizedBox(height: 50),
            Text(
              textAlign: TextAlign.center,
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
