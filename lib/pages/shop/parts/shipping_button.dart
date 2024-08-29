import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShippingButton extends StatefulWidget {
  const ShippingButton({
    super.key,
    required this.hasShipping,
    required this.isLightBrightness,
  });

  final bool hasShipping;
  final bool isLightBrightness;

  @override
  State<ShippingButton> createState() => _ShippingButtonState();
}

class _ShippingButtonState extends State<ShippingButton> {
  final _tooltipController = JustTheController();

  @override
  void dispose() {
    _tooltipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return JustTheTooltip(
      elevation: 6,
      backgroundColor: elevatedButtonColor,
      controller: _tooltipController,
      preferredDirection: AxisDirection.up,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.hasShipping ? '${lang.hasShipping} !' : '${lang.noShipping} !',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      child: GestureDetector(
        onTap: () => _tooltipController.showTooltip(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: widget.hasShipping
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
              color:
                  widget.isLightBrightness ? elevatedButtonColor : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
