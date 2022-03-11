abstract class AppRoutes {
  static const SIGN_UP = "/sign_up";
  static const SIGN_IN = "/sign_in";
  static const SIGN_SPLASH = "/sign_splash";
  static const HOME = "/home";
}

class AppRoutesGroups {
  static const HOME_GROUP = [
    AppRoutes.HOME,
  ];
  static const SIGN_GROUP = [
    AppRoutes.SIGN_UP,
    AppRoutes.SIGN_IN,
    AppRoutes.SIGN_SPLASH,
  ];
}
