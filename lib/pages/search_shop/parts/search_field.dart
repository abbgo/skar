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
    required this.autofocus,
    required this.hintText,
    required this.initText,
  });

  final void Function() onPressed;
  final void Function(String) onSubmitted;
  final bool autofocus;
  final String hintText;
  final String initText;

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
    return Consumer(
      builder: (context, ref, child) {
        bool isLightBrightness = isLightTheme(context, ref);
        searchCtrl.text = widget.initText;

        return SizedBox(
          height: 40,
          width: screenProperties(context).width - 70,
          child: TextField(
            controller: searchCtrl,
            autofocus: widget.autofocus,
            textInputAction: TextInputAction.search,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: isLightBrightness ? elevatedButtonColor : Colors.white,
            decoration: InputDecoration(
              focusedBorder: inputBorder(context, ref),
              border: inputBorder(context, ref),
              hintText: widget.hintText,
              suffixIcon: IconButton(
                icon: const Icon(Icons.backspace_outlined, size: 18),
                onPressed: () {
                  widget.onPressed();
                  searchCtrl.clear();
                },
              ),
            ),
            onSubmitted: (value) => widget.onSubmitted(value),
          ),
        );
      },
    );
  }
}
