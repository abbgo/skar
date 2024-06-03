import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:skar/providers/params/shop_param.dart';

class ShopSearchField extends ConsumerWidget {
  ShopSearchField({super.key, required this.forShops});

  final TextEditingController searchCtrl = TextEditingController();
  final bool forShops;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return SizedBox(
      height: 40,
      width: screenProperties(context).width - 70,
      child: TextField(
        controller: searchCtrl,
        autofocus: forShops ? true : false,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0, left: 20),
          hintText: forShops ? lang.searchShop : lang.searchProduct,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlinedInputBorder(),
          focusedBorder: outlinedInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.backspace_outlined,
              color: elevatedButtonColor,
              size: 18,
            ),
            onPressed: () async {
              if (forShops) {
                ref.read(shopSearchProvider.notifier).state = '';
              } else {
                ref.read(productSearchProvider.notifier).state = '';
              }
              searchCtrl.clear();
            },
          ),
        ),
        onSubmitted: (value) {
          if (forShops) {
            ref.read(shopSearchProvider.notifier).state = value;
            ref.read(hasShopsProvider.notifier).state = true;
            return;
          }
          ref.read(productSearchProvider.notifier).state = value;
          ref.read(hasProductsProvider.notifier).state = true;
        },
      ),
    );
  }
}

OutlineInputBorder outlinedInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: elevatedButtonColor),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
}
