import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/internet_connection.dart';

class InternetError extends StatelessWidget {
  const InternetError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Internet baglanysygy yok !',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                ref.read(intConnStatusProvider.notifier).checkInt();
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh),
                    SizedBox(width: 10),
                    Text('Tazeden synans !'),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
