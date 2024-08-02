import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/pages/sort_and_filter_product.dart';

class RadioListTileWidget extends ConsumerWidget {
  const RadioListTileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String priceRange = ref.watch(priceRangeProvider);

    return RadioListTile.adaptive(
      value: '0 man - 100 man',
      groupValue: priceRange,
      onChanged: (value) =>
          ref.read(priceRangeProvider.notifier).state = value!,
    );
  }
}
