import 'package:flutter/material.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';

class MapSearchBar extends StatelessWidget {
  const MapSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenProperties screenSize = screenProperties(context);
    return SizedBox(
      height: 50,
      width: screenSize.width - 50,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlinedInputBorder(),
          focusedBorder: outlinedInputBorder(),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10, top: 3),
            child: Icon(Icons.search, size: 25),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlinedInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }
}
