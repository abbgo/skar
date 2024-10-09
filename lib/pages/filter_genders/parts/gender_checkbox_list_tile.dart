import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/notifiers/pages/filter_genders.dart';
import 'package:skar/styles/colors.dart';

class GenderCheckboxListTile extends ConsumerWidget {
  const GenderCheckboxListTile({
    super.key,
    required this.title,
    required this.gender,
    required this.provider,
  });

  final int gender;
  final String title;
  final StateNotifierProvider<SelectedProductGendersNotifier, List<dynamic>>
      provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<dynamic> genders = ref.watch(provider);

    return CheckboxListTile.adaptive(
      activeColor: elevatedButtonColor,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      value: genders.contains(gender),
      onChanged: (value) async {
        if (value!) {
          await ref.read(provider.notifier).addGender(gender);
          return;
        }
        await ref.read(provider.notifier).removeGender(gender);
      },
    );
  }
}
