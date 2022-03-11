import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klocalizations_flutter/klocalizations_flutter.dart';

import 'constants/_constants_exporter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ServerController serverController = Get.put(ServerController());
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Suw.init(
      GetMaterialApp(
        navigatorObservers: [HeroController()],
        transitionDuration: const Duration(microseconds: 1),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: KColors.primaryColor,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: Colors.black,
          ),
        ),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale("tr")],
        debugShowCheckedModeBanner: false,
        getPages: getPages,
        initialRoute: AppRoutes.SIGN_SPLASH,
      ),
    );
  }
}
