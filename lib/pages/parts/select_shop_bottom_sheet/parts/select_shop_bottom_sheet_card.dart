import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/child_shops/child_shops.dart';
import 'package:skar/pages/shop/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class SelectShopBottomSheetCard extends ConsumerWidget {
  const SelectShopBottomSheetCard({
    super.key,
    required this.shop,
    required this.forParentShop,
  });

  final Shop shop;
  final bool forParentShop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(langProvider) == 'tr';

    return Card(
      child: ListTile(
        title: Text(
          isTM ? shop.nameTM! : shop.nameRU!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.adaptive.arrow_forward),
        onTap: () => forParentShop
            ? goToPage(
                context,
                ChildShopsPage(parentShopID: shop.id!),
                false,
              )
            : goToPage(context, ShopPage(shopID: shop.id!), false),
      ),
    );
  }
}
