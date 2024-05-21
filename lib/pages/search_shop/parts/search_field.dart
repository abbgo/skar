import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/params/shop_param.dart';

class ShopSearchField extends ConsumerWidget {
  ShopSearchField({super.key});

  final TextEditingController searchShopCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 40,
      width: screenProperties(context).width - 70,
      child: TextField(
        controller: searchShopCtrl,
        autofocus: true,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0, left: 20),
          hintText: AppLocalizations.of(context)!.searchShop,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlinedInputBorder(),
          focusedBorder: outlinedInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.search, color: elevatedButtonColor, size: 26),
            onPressed: () async {
              await ref
                  .read(shopParamProvider.notifier)
                  .changeSearch(searchShopCtrl.text);
            },
          ),
        ),
        // onSubmitted: (value) async {
        //   // await ref.read(markersProvider.notifier).removeAllMarkers();
        //   // ref.read(shopParamProvider.notifier).changeSearch(value);
        //   // Navigator.pop(context);
        // },
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
