import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/providers/pages/search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/params/shop_param.dart';

class MapSearchBar extends ConsumerWidget {
  MapSearchBar({super.key});

  final double minRightSize = 10.0;
  final double maxRightSize = 25.0;
  final FocusNode focusNode = FocusNode();
  final TextEditingController searchShopCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    ScreenProperties screenSize = screenProperties(context);
    double rightSize = ref.watch(rightSizeProvider);

    return AnimatedPositioned(
      top: screenSize.topSafeArea + 5,
      right: rightSize,
      duration: const Duration(milliseconds: 300),
      height: 40,
      width: rightSize == minRightSize ? 40 : screenSize.width - 50,
      child: TextField(
        controller: searchShopCtrl,
        focusNode: focusNode,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0, left: 20),
          hintText: lang.searchShop,
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
        onSubmitted: (value) {
          print('-------------------- $value');
          ref.read(shopParamProvider.notifier).changeSearch(value);
        },
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
