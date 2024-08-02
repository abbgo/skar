import 'package:flutter/material.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(child: Text('salam')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(20)),
                  ),
                  child: const Center(child: Text('Goybolsun et')),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(20)),
                  ),
                  child: const Center(child: Text('Sayla')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
