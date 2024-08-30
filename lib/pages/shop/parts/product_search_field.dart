import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/parts/input.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/params/product_param.dart';

class ProductSearchField extends StatefulWidget {
  const ProductSearchField({super.key});

  @override
  State<ProductSearchField> createState() => _ProductSearchFieldState();
}

class _ProductSearchFieldState extends State<ProductSearchField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        bool isLightBrightness = isLightTheme(context, ref);

        return Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SizedBox(
            height: 35,
            width: screenProperties(context).width - 150,
            child: Consumer(
              builder: (context, ref, child) {
                return TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.search,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor:
                      isLightBrightness ? elevatedButtonColor : Colors.white,
                  decoration: InputDecoration(
                    focusedBorder: inputBorder(context, ref),
                    border: inputBorder(context, ref),
                    hintText: AppLocalizations.of(context)!.searchProduct,
                    suffixIcon: GestureDetector(
                      child: Icon(
                        Icons.close,
                        color: isLightBrightness
                            ? elevatedButtonColor
                            : Colors.white,
                        size: 18,
                      ),
                      onTap: () {
                        _focusNode.unfocus();
                        _controller.clear();
                        ref.read(shopProductSearchProvider.notifier).state = '';
                        ref.read(hasShopProductsProvider.notifier).state = true;
                      },
                    ),
                  ),
                  onSubmitted: (value) async {
                    ref.read(shopProductSearchProvider.notifier).state = value;
                    ref.read(hasShopProductsProvider.notifier).state = true;
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
