import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/pages/map.dart';

class ShopList extends ConsumerWidget {
  const ShopList({super.key});

  static const pageSize = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    double bannerHeight = ref.watch(bannerHeightProvider);
    double turns = ref.watch(turnsProvider);
    bool isTM = ref.watch(isTmProvider);

    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (bannerHeight == 0.4) {
          ref.read(bannerHeightProvider.notifier).state = 0.06;
          ref.read(turnsProvider.notifier).state += 1 / 2;
        } else {
          ref.read(bannerHeightProvider.notifier).state = 0.4;
          ref.read(turnsProvider.notifier).state -= 1 / 2;
        }
      },
      child: AnimatedContainer(
        height: screenProperties(context).height * bannerHeight,
        width: screenProperties(context).width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 15, right: 15),
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

                    final AsyncValue<ResultShop> responseAsync =
                        ref.watch(fetchShopsProvider(page));

                    return responseAsync.when(
                      data: (response) {
                        if (response.error != '') {
                          return const SomeThingWrong();
                        }

                        if (indexInPage >= response.shops!.length) {
                          return null;
                        }
                        final shop = response.shops![indexInPage];
                        return listviewChildMethod(context, shop, isTM);
                      },
                      error: (error, stackTrace) => errorMethod(error),
                      loading: () => loadWidget,
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

  Padding listviewChildMethod(BuildContext context, Shop shop, bool isTM) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
      child: Container(
        width: 230,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 8,
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
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
                          child: listviewCallButtonMethod(context, shop),
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

  Row topBottomNavigationMethod(AppLocalizations lang, double turns) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang.proposedShops,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        AnimatedRotation(
          turns: turns,
          duration: const Duration(microseconds: 1000),
          child: const Icon(Icons.arrow_downward_rounded),
        ),
      ],
    );
  }
}
