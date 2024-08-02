import 'package:flutter/material.dart';
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

class ToolTipCustomDecoration extends ShapeBorder {
  final bool isPaddingRequired;

  const ToolTipCustomDecoration({this.isPaddingRequired = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: isPaddingRequired ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));

    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 3)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 20)
      ..relativeLineTo(10, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
