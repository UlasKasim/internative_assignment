import 'package:get/get.dart';
import 'package:mobile/constants/_constants_exporter.dart';
import 'package:mobile/pages/home/_home_page_exporter.dart';
import 'package:mobile/pages/sign/_sign_page_exporter.dart';

List<GetPage> getPages = [
  GetPage(
    name: AppRoutes.SIGN_IN,
    page: () => const SignInPage(),
  ),
  GetPage(
    name: AppRoutes.SIGN_UP,
    page: () => const SignUpPage(),
  ),
  GetPage(
    name: AppRoutes.SIGN_SPLASH,
    page: () => const SignSplash(),
  ),
  GetPage(
    name: AppRoutes.HOME,
    page: () => const HomePage(),
  ),
];
