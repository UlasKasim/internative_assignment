import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationUtil {
  static void pushNamed(String route) {
    if (Get.currentRoute == route) return;

    Get.offNamedUntil(
      route,
      (route) => route.isFirst,
    );
  }

  static void push(Widget page) {
    Get.offUntil(
        GetPageRoute(
          page: () => page,
          transition: Transition.noTransition,
          // curve: Curves.bounceIn,
          // transitionDuration: Duration(milliseconds: 300),
        ),
        (route) => route.isFirst);
  }

  static void offAll(Widget page) {
    Get.offAll(page, predicate: (route) => route.isFirst);
  }

  static void offAllNamed(String route) {
    Get.offAllNamed(route);
  }
}
