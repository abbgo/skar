import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopSearchField extends StatelessWidget {
  ShopSearchField({super.key});

  final TextEditingController searchShopCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          suffixIcon: Icon(Icons.search, color: elevatedButtonColor),
        ),
        // onSubmitted: (value) async {
        //   await ref.read(markersProvider.notifier).removeAllMarkers();
        //   ref.read(shopParamProvider.notifier).changeSearch(value);
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
