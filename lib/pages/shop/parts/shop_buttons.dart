import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/search_product/parts/product_search_field.dart';
import 'package:skar/providers/pages/shop.dart';

class ShopPageButtons extends ConsumerWidget {
  const ShopPageButtons({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool openSearchBar = ref.watch(openSearchBarProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.adaptive.arrow_back, color: Colors.black),
        ),
        openSearchBar
            ? ProductSearchField()
            : Row(
                children: [
                  IconButton(
                    // onPressed: () =>
                    //     goToPage(context, const SearchProduct(), false),
                    onPressed: () =>
                        ref.read(openSearchBarProvider.notifier).state = true,
                    icon: Image.asset("assets/icons/search.png", height: 25),
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.favorite_border, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () => showCallBottomSheet(context, shop.phones!),
                    icon: const Icon(Icons.call, color: Colors.green),
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.more_horiz, color: Colors.black),
                  ),
                ],
              ),
      ],
    );
  }
}
