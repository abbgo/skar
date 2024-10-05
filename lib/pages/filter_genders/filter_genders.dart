import 'package:flutter/material.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/pages/filter_genders/parts/gender_checkbox_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterGendersPage extends StatelessWidget {
  const FilterGendersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: const Text('Jynsy')),
      body: Column(
        children: [
          GenderCheckboxListTile(title: lang.male, gender: Genders.male),
          GenderCheckboxListTile(title: lang.female, gender: Genders.female),
          GenderCheckboxListTile(title: lang.child, gender: Genders.child),
        ],
      ),
    );
  }
}
