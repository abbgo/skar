import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/notifiers/pages/filter_genders.dart';
import 'package:skar/pages/filter_genders/parts/gender_checkbox_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/parts/filter_categories/parts/filter_categories_save_button.dart';

class FilterGendersPage extends StatelessWidget {
  const FilterGendersPage({super.key, required this.provider});

  final StateNotifierProvider<SelectedProductGendersNotifier, List<dynamic>>
      provider;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: const Text('Jynsy')),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                GenderCheckboxListTile(
                  title: lang.male,
                  gender: Genders.male,
                  provider: provider,
                ),
                GenderCheckboxListTile(
                  title: lang.female,
                  gender: Genders.female,
                  provider: provider,
                ),
                GenderCheckboxListTile(
                  title: lang.child,
                  gender: Genders.child,
                  provider: provider,
                ),
              ],
            ),
          ),
          const FilterCategoriesSaveButton(),
        ],
      ),
    );
  }
}
