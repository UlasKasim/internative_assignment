import 'package:get/get.dart';
import 'package:mobile/login/_login_page_exporter.dart';

import 'routes.dart';

List<GetPage> getPages = [
  GetPage(
    name: AppRoutes.SIGN_IN,
    page: () => const SignInPage(),
  ),
  GetPage(
    name: AppRoutes.LOGIN_SPLASH,
    page: () => const LoginSplash(),
  ),
  // GetPage(
  //   name: AppRoutes.HOME,
  //   page: () => const HomePage(),
  // ),
];
