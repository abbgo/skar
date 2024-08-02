import 'package:flutter/material.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/styles/tooltip_decoration.dart';

class ShippingButton extends StatelessWidget {
  ShippingButton({
    super.key,
    required this.hasShipping,
    required this.isLightBrightness,
  });

  final bool hasShipping;
  final bool isLightBrightness;

  final GlobalKey _tooltipKey = GlobalKey();

  void _showTooltip() {
    final dynamic tooltip = _tooltipKey.currentState;
    tooltip?.ensureTooltipVisible();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Tooltip(
      key: _tooltipKey,
      message: hasShipping ? lang.hasShipping : lang.noShipping,
      decoration: ShapeDecoration(
        shape: const ToolTipCustomDecoration(),
        color: elevatedButtonColor,
      ),
      preferBelow: false,
      verticalOffset: 10,
      child: GestureDetector(
        onTap: () => _showTooltip(),
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
