import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:skar/pages/start.dart';
import 'package:skar/pages/statute.dart';
import 'datas/local_storadge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await LocalStoragde().createSharedPrefObject();
  await dotenv.load(fileName: ".env");

  runApp(
    ChangeNotifierProvider<LocalStoragde>(
      create: (BuildContext context) => LocalStoragde(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(elevatedButtonColor),
          ),
        ),
      ),
      home: const StartPage(),
      locale: const Locale('tr'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // GET DATA FROM LOCAL STORAGDE
    var localStoradgeFalse = Provider.of<LocalStoragde>(context, listen: false);
    localStoradgeFalse.getFirstTimeFromSharedPref();
    localStoradgeFalse.getLangFromSharedPref();

    return localStoradgeFalse.getFirstTime()
        ? const StatutePage()
        : BottomNavigationPage(
            isMapPage: true,
            shopID: "",
            isTM: localStoradgeFalse.getLang(),
          );
  }
}
