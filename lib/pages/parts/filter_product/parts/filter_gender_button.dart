import 'package:flutter/material.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/filter_genders/filter_genders.dart';

class FilterGenderButton extends StatelessWidget {
  const FilterGenderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 25, top: 15, bottom: 10),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          CustomPageRoute(
            child: const FilterGendersPage(),
            direction: AxisDirection.left,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Jynsy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Icon(Icons.adaptive.arrow_forward),
          ],
        ),
      ),
    );
  }
}
