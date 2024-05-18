import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/providers/pages/search_bar.dart';

class MapSearchBar extends ConsumerWidget {
  MapSearchBar({super.key});

  final double minRightSize = 10.0;
  final double maxRightSize = 25.0;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenProperties screenSize = screenProperties(context);
    double rightSize = ref.watch(rightSizeProvider);

    return AnimatedPositioned(
      top: screenSize.topSafeArea + 5,
      right: rightSize,
      duration: const Duration(milliseconds: 300),
      height: 40,
      width: rightSize == minRightSize ? 40 : screenSize.width - 50,
      child: TextFormField(
        focusNode: focusNode,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0, left: 20),
          hintText: 'Magazyn gozle...',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlinedInputBorder(),
          focusedBorder: outlinedInputBorder(),
          suffixIcon: IconButton(
            onPressed: () {
              if (rightSize == minRightSize) {
                ref.read(rightSizeProvider.notifier).state = maxRightSize;
                FocusScope.of(context).requestFocus(focusNode);
                return;
              }
              ref.read(rightSizeProvider.notifier).state = minRightSize;
              FocusScope.of(context).unfocus();
            },
            icon: Icon(
              rightSize == minRightSize ? Icons.search : Icons.close,
              size: 22,
              color: elevatedButtonColor,
            ),
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
