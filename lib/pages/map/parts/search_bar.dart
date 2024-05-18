import 'package:flutter/material.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';

class MapSearchBar extends StatelessWidget {
  const MapSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenProperties screenSize = screenProperties(context);
    return SizedBox(
      height: 40,
      width: screenSize.width - 50,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0),
          hintText: 'Magazyn gozle...',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlinedInputBorder(),
          focusedBorder: outlinedInputBorder(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, top: 3),
            child: Icon(Icons.search, size: 25, color: elevatedButtonColor),
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
