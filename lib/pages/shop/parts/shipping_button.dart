import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShippingButton extends StatelessWidget {
  ShippingButton({
    super.key,
    required this.hasShipping,
    required this.isLightBrightness,
  });

  final bool hasShipping;
  final bool isLightBrightness;

  final tooltipController = JustTheController();

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return JustTheTooltip(
      elevation: 6,
      backgroundColor: elevatedButtonColor,
      controller: tooltipController,
      preferredDirection: AxisDirection.up,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          hasShipping ? '${lang.hasShipping} !' : '${lang.noShipping} !',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          if (tooltipController.value == TooltipStatus.isHidden) {
            tooltipController.showTooltip();
          } else {
            tooltipController.hideTooltip();
          }
        },
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
            Icon(
              Icons.info,
              size: 10,
              color: isLightBrightness ? elevatedButtonColor : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
