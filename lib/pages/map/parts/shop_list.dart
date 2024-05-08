import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/models/shop.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/providers/models/shop.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/services/shop.dart';

class ShopList extends ConsumerStatefulWidget {
  const ShopList({super.key});

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends ConsumerState<ShopList> {
  // VARIABLES -----------------------------------------------------------------
  final ScrollController _scrollController = ScrollController();

  // FUNCTIONS -----------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        ref.read(shopPageProvider.notifier).state++;
        // _loadPagination = true;
        // List<Shop> newShops = await Shop.fetchShops('shops', 10, _page, true);
        // brendShops.then((value) {
        //   value.addAll(newShops);
        //     // _loadPagination = false;
        // });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Consumer(
      builder: (context, ref, child) {
        double bannerHeight = ref.watch(bannerHeightProvider);
        double turns = ref.watch(turnsProvider);
        // bool loadPagination = ref.watch(loadPaginationProvider);
        bool isTM = ref.watch(isTmProvider);
        ShopParam shopParam = const ShopParam(api: 'shops');
        AsyncValue<List<Shop>> brendShops = ref.watch(shopsProvider(shopParam));

        return GestureDetector(
          onVerticalDragEnd: (details) {
            if (bannerHeight == 0.4) {
              ref.read(bannerHeightProvider.notifier).state = 0.07;
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
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topBottomNavigationMethod(lang, turns),
                  // loadProgressMethod(loadPagination),
                  shopListMethod(brendShops, context, isTM)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded shopListMethod(
      AsyncValue<List<Shop>> brendShops, BuildContext context, bool isTM) {
    return Expanded(
      child: brendShops.when(
        data: (data) {
          var shops = ref.watch(shopDataProvider);

          return listviewMethod(
            context,
            shops,
            isTM,
            _scrollController,
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  SizedBox loadProgressMethod(bool loadPagination) {
    return SizedBox(
      height: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: loadPagination
            ? LinearProgressIndicator(color: elevatedButtonColor)
            : const SizedBox(),
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
