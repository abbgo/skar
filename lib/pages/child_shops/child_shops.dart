import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          autofocus: false,
          hintText: lang.searchShop,
          initText: '',
          ref: ref,
        ),
      ),
      body: const ChildShopsBody(),
    );
  }
}
