import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/call_button.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/styles/colors.dart';

class ShopListCard extends ConsumerWidget {
  const ShopListCard({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    bool isTM = ref.watch(langProvider) == 'tr';

    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
      child: Container(
        width: screenProperties(context).width * 0.35,
        decoration: BoxDecoration(
          color: isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: listviewImageMethod(context, shop, isTM),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
                child: Container(
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: listviewNameColumnMethod(shop, isTM),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: CallButton(shop: shop),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
