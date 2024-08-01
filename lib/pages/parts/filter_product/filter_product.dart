import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenProperties(context).height - 100,
      width: screenProperties(context).width,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
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
