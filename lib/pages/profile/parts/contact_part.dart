import 'package:flutter/material.dart';
import 'package:skar/methods/pages/contact.dart';
import 'package:skar/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactPart extends StatelessWidget {
  const ContactPart({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Card(
      elevation: 3,
      color: elevatedButtonColor,
      child: ListTile(
        onTap: () => showContactBottomSheet(context),
        leading: const Icon(Icons.perm_phone_msg_outlined, color: Colors.white),
        title: Text(
          lang.theme,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
