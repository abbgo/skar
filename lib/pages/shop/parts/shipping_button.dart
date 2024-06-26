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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: hasShipping
                ? Image.asset(
                    "assets/icons/has_shipping.png",
                    height: 23,
                  )
                : Image.asset(
                    "assets/icons/no_shipping.png",
                    height: 23,
                  ),
          ),
          Icon(Icons.info, size: 10, color: elevatedButtonColor),
        ],
      ),
    );
  }
}
