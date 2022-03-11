import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return Container();
    // return Suw.init(
    //   GetMaterialApp(
    //     transitionDuration: const Duration(microseconds: 1),
    //     theme: ThemeData.dark().copyWith(
    //       scaffoldBackgroundColor: KColors.white,
    //       canvasColor: KColors.secondaryColor,
    //       textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
    //         bodyColor: KColors.black,
    //       ),
    //     ),
    //     localizationsDelegates: GlobalMaterialLocalizations.delegates,
    //     supportedLocales: const [Locale("tr")],
    //     debugShowCheckedModeBanner: false,
    //     getPages: getPages,
    //     initialRoute: AppRoutes.LOGIN_SPLASH,
    //   ),
    // );
  }
}
