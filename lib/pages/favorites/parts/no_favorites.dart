import 'package:flutter/widgets.dart';

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
            Image.asset("assets/images/empty_cart.jpg"),
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
