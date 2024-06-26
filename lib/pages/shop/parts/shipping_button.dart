import 'package:flutter/material.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShippingButton extends StatelessWidget {
  const ShippingButton({super.key, required this.hasShipping});

  final bool hasShipping;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => showTopSnackbar(
        context,
        hasShipping ? lang.hasShipping : lang.noShipping,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.shop),
          Icon(Icons.info, size: 10, color: elevatedButtonColor),
        ],
      ),
    );
  }
}
