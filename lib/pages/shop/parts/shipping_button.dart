import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class ShippingButton extends StatelessWidget {
  const ShippingButton({super.key, this.hasDelivery});

  final bool? hasDelivery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Snackbar message'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
            bottom: screenProperties(context).height -
                (screenProperties(context).topSafeArea + 80),
            right: 20,
            left: 20,
          ),
        ));
      },
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
