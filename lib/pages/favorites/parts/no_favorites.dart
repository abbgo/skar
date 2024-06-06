import 'package:flutter/widgets.dart';
import 'package:skar/helpers/functions.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    bool isLightBrightness = screenProperties(context).isLightBrightness;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isLightBrightness
                  ? "assets/images/empty_cart.jpg"
                  : "assets/images/empty_cart_dark.jpg",
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
