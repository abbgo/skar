import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/map/parts/shop_list_card.dart';
import 'package:skar/providers/api/shop.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/services/shop.dart';
import 'package:skar/styles/colors.dart';

class ShopList extends ConsumerWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    var lang = AppLocalizations.of(context)!;
    double bannerHeight = ref.watch(bannerHeightProvider);
    double turns = ref.watch(turnsProvider);

    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (bannerHeight == 0.25) {
          ref.read(bannerHeightProvider.notifier).state = 0.06;
          ref.read(turnsProvider.notifier).state += 1 / 2;
        } else {
          ref.read(bannerHeightProvider.notifier).state = 0.25;
          ref.read(turnsProvider.notifier).state -= 1 / 2;
        }
      },
      child: AnimatedContainer(
        height: screenProperties(context).height * bannerHeight,
        width: screenProperties(context).width,
        decoration: BoxDecoration(
          color: isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 10, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBottomNavigationMethod(lang, turns),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;

                    ShopParams shopParams =
                        ShopParams(page: page, isRandom: true);

                    final AsyncValue<ResultShop> responseAsync =
                        ref.watch(fetchBrendShopsProvider(shopParams));

                    return responseAsync.when(
                      skipError: true,
                      skipLoadingOnRefresh: true,
                      skipLoadingOnReload: true,
                      data: (response) {
                        if (response.error != '') {
                          return null;
                        }

                        if (indexInPage >= response.shops!.length) {
                          return null;
                        }

                        final shop = response.shops![indexInPage];
                        return ShopListCard(shop: shop);
                      },
                      error: (error, stackTrace) => errorMethod(error),
                      loading: () => null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row topBottomNavigationMethod(AppLocalizations lang, double turns) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang.proposedShops,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        AnimatedRotation(
          turns: turns,
          duration: const Duration(microseconds: 1000),
          child: const Icon(Icons.arrow_downward_rounded, size: 20),
        ),
      ],
    );
  }
}
