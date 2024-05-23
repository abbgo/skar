import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductSearchField extends StatelessWidget {
  ProductSearchField({super.key});

  final TextEditingController searchProductCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: screenProperties(context).width - 70,
      child: TextField(
        controller: searchProductCtrl,
        autofocus: true,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0, left: 20),
          hintText: AppLocalizations.of(context)!.searchProduct,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlinedInputBorder(),
          focusedBorder: outlinedInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.search, color: elevatedButtonColor, size: 26),
            onPressed: () async {
              // ref.read(shopSearchProvider.notifier).state = searchShopCtrl.text;
              // ref.read(hasShopsProvider.notifier).state = true;
            },
          ),
        ),
        onSubmitted: (value) async {
          // ref.read(shopSearchProvider.notifier).state = searchShopCtrl.text;
          // ref.read(hasShopsProvider.notifier).state = true;
        },
      ),
    );
  }
}
