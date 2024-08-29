import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/parts/input.dart';
import 'package:skar/styles/colors.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.onPressed,
    required this.onSubmitted,
    required this.hintText,
    required this.initText,
    required this.ref,
  });

  final void Function() onPressed;
  final void Function(String) onSubmitted;
  final String hintText;
  final String initText;
  final WidgetRef ref;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController searchCtrl = TextEditingController();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightBrightness = isLightTheme(context, widget.ref);
    searchCtrl.text = widget.initText;

    return SizedBox(
      height: 40,
      child: TextField(
        controller: searchCtrl,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: isLightBrightness ? elevatedButtonColor : Colors.white,
        decoration: InputDecoration(
          focusedBorder: inputBorder(context, widget.ref),
          border: inputBorder(context, widget.ref),
          hintText: widget.hintText,
          suffixIcon: GestureDetector(
            child: const Icon(Icons.backspace_outlined, size: 18),
            onTap: () {
              widget.onPressed();
              searchCtrl.clear();
            },
          ),
        ),
        onSubmitted: (value) => widget.onSubmitted(value),
      ),
    );
  }
}
