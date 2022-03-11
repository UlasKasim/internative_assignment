import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationUtil {
  static void getPushNamed(String route) {
    if (Get.currentRoute == route) return;

    Get.toNamed(
      route,
    );
  }

  static void getPush(Widget page) {
    Get.to(GetPageRoute(
      page: () => page,
      transition: Transition.noTransition,
    ));
  }

  static void offAll(Widget page) {
    Get.offAll(page, predicate: (route) => route.isFirst);
  }

  static void offAllNamed(String route) {
    if (Get.currentRoute == route) return;
    Get.offAllNamed(route);
  }
}
