import 'package:flutter/material.dart';

class MinAndMaxInputs extends StatefulWidget {
  const MinAndMaxInputs({super.key});

  @override
  State<MinAndMaxInputs> createState() => _MinAndMaxInputsState();
}

class _MinAndMaxInputsState extends State<MinAndMaxInputs> {
  final TextEditingController minPriceCtrl = TextEditingController();
  final TextEditingController maxPriceCtrl = TextEditingController();

  @override
  void dispose() {
    minPriceCtrl.dispose();
    maxPriceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: minPriceCtrl,
              decoration: const InputDecoration(
                hintText: ' In pes baha ',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: maxPriceCtrl,
              decoration: const InputDecoration(
                hintText: ' In yokary baha ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
