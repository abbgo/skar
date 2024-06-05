import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/models/theme.dart';
import 'package:skar/providers/local_storadge/setting.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: elevatedButtonColor.withOpacity(.8),
      child: Consumer(
        builder: (context, ref, child) {
          var lang = AppLocalizations.of(context)!;
          String themeText = '';
          int theme = ref.watch(themeProvider);

          if (theme == ThemeType.system) {
            themeText = lang.systemTheme;
          } else if (theme == ThemeType.white) {
            themeText = lang.whiteTheme;
          } else {
            themeText = lang.blackTheme;
          }

          return ListTile(
            // onTap: () => showLanguageMethod(context),
            leading: const Icon(Icons.contrast, color: Colors.white),
            title: Text(
              lang.theme,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: Text(
              themeText,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
