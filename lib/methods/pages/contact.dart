import 'package:flutter/material.dart';
import 'package:skar/pages/parts/contact_bottom_sheet.dart';

showContactBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const ContactBottomSheet(),
  );
}
