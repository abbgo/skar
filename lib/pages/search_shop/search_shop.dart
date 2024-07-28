import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/parts/appbar_leading_back_button.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:skar/pages/search_shop/parts/search_shop_result.dart';
import 'package:skar/providers/pages/search_shop.dart';
import 'package:skar/providers/params/shop_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchShopPage extends ConsumerWidget {
  const SearchShopPage({super.key, required this.mapPageContext});

  final BuildContext mapPageContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    bool openSearchShopNavigateToTopButton =
        ref.watch(openSearchShopNavigateToTopButtonProvider);
    ScrollController scrollController =
        ref.watch(searchShopScrollControllerProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          ref.read(shopSearchProvider.notifier).state = '';
          return;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const AppBarLeadingBackButton(),
          title: SearchField(
            onPressed: () => ref.read(shopSearchProvider.notifier).state = '',
            onSubmitted: (value) {
              ref.read(shopSearchProvider.notifier).state = value;
              ref.read(hasShopsProvider.notifier).state = true;
            },
            autofocus: true,
            hintText: lang.searchShop,
            initText: ref.watch(shopSearchProvider),
            ref: ref,
          ),
        ),
        body: SearchShopResult(mapPageContext: mapPageContext),
        floatingActionButton: openSearchShopNavigateToTopButton
            ? FloatingActionButton(
                onPressed: () async {
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: Icon(
                  Icons.arrow_upward,
                  color: isLightBrightness ? Colors.white : Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
