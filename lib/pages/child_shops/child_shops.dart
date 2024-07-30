import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/child_shops/parts/child_shops_body.dart';
import 'package:skar/pages/search_shop/parts/search_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/pages/child_shops.dart';

class ChildShopsPage extends ConsumerWidget {
  const ChildShopsPage({super.key, required this.parentShopID});

  final String parentShopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    ScrollController scrollController =
        ref.watch(childShopsScrollControllerProvider);
    bool openNavigateToTopButton =
        ref.watch(openChildShopsProductNavigateToTopButtonProvider);
    bool isLightBrightness = isLightTheme(context, ref);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: SearchField(
          onPressed: () {
            ref.read(childShopsSearchProvider.notifier).state = '';
            ref.read(hasChildShopsProvider.notifier).state = true;
          },
          onSubmitted: (value) {
            ref.read(childShopsSearchProvider.notifier).state = value;
            ref.read(hasChildShopsProvider.notifier).state = true;
          },
          hintText: lang.searchShop,
          initText: ref.watch(childShopsSearchProvider),
          ref: ref,
        ),
      ),
      body: ChildShopsBody(parentShopID: parentShopID),
      floatingActionButton: openNavigateToTopButton
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
    );
  }
}
