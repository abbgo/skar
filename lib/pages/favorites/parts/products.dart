import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/pages/favorites/parts/no_favorites.dart';
import 'package:skar/providers/params/product_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteProducts extends ConsumerWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasFavoriteProducts = ref.watch(hasFavoriteProductsProvider);

    return !hasFavoriteProducts
        ? NoFavorites(text: AppLocalizations.of(context)!.noFavoriteProducts)
        : const Center(child: Text('has data'));
  }
}
