import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skar/database/config.dart';
import 'package:skar/models/theme.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/pages/start.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/styles/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance(); // shared preferences
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); // app dine portrait gornusinde bolmagy ucin
  await createDB(); // create database
  await dotenv.load(fileName: ".env"); // load .env file
  runApp(const ProviderScope(child: MyApp())); // run app
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode? themeMode = ThemeMode.system;
    String language = ref.watch(langProvider);
    int theme = ref.watch(themeProvider);

    if (theme == ThemeType.system) {
      themeMode = ThemeMode.system;
    } else if (theme == ThemeType.white) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const StartPage(),
      locale: Locale(language),
    );
  }
}
