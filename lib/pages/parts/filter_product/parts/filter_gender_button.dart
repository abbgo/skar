import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/datas/static.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/pages/filter_genders/filter_genders.dart';
import 'package:skar/providers/pages/filter_genders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterGenderButton extends ConsumerWidget {
  const FilterGenderButton({super.key, required this.forSearchProduct});

  final bool forSearchProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    String genderNames = '';

    List<dynamic> genders = forSearchProduct
        ? ref.watch(productSearchGendersProvider)
        : ref.watch(productGendersProvider);

    if (genders.isNotEmpty) {
      if (genders.contains(Genders.male)) {
        genderNames += '${lang.male} ,';
      }
      if (genders.contains(Genders.female)) {
        genderNames += '${lang.female} ,';
      }
      if (genders.contains(Genders.child)) {
        genderNames += '${lang.child} ,';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 25, right: 25),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          CustomPageRoute(
            child: FilterGendersPage(forSearchProduct: forSearchProduct),
            direction: AxisDirection.left,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jynsy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  genderNames == '' ? const SizedBox() : Text(genderNames)
                ],
              ),
            ),
            Row(
              children: [
                genderNames == ''
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () async {
                          forSearchProduct
                              ? await ref
                                  .read(productSearchGendersProvider.notifier)
                                  .removeAllGenders()
                              : await ref
                                  .read(productGendersProvider.notifier)
                                  .removeAllGenders();
                        },
                        icon: const Icon(Icons.clear_outlined),
                      ),
                Icon(Icons.adaptive.arrow_forward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
