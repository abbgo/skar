import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/providers/pages/statute.dart';

class StatuteCheckBox extends ConsumerWidget {
  const StatuteCheckBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool isChecked = ref.watch(checkBoxProvider);

    return GestureDetector(
      onTap: () => ref.read(checkBoxProvider.notifier).state = !isChecked,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.0,
            child: SizedBox(
              width: 20,
              child: Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  ref.read(checkBoxProvider.notifier).state = !isChecked;
                },
                activeColor: elevatedButtonColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              lang.acceptStatute,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
