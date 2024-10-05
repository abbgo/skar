import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/pages/filter_genders.dart';
import 'package:skar/styles/colors.dart';

class GenderCheckboxListTile extends ConsumerWidget {
  const GenderCheckboxListTile(
      {super.key, required this.title, required this.gender});

  final int gender;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<dynamic> genders = ref.watch(productGendersProvider);

    return CheckboxListTile.adaptive(
      activeColor: elevatedButtonColor,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      value: genders.contains(gender),
      onChanged: (value) async {
        if (value!) {
          await ref.read(productGendersProvider.notifier).addGender(gender);
          return;
        }
        await ref.read(productGendersProvider.notifier).removeGender(gender);
      },
    );
  }
}
