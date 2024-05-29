import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skar/database/config.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/start.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'HeyWowRegular',
        textTheme:
            Theme.of(context).textTheme.apply(fontFamily: 'HeyWowRegular'),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(elevatedButtonColor),
          ),
        ),
      ),
      home: const StartPage(),
      locale: const Locale('tr'),
    );
  }
}
