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
    Get.to(() => page);
  }

  static void offAll(Widget page) {
    Get.offAll(page, predicate: (route) => route.isFirst);
  }

  static void offAllNamed(String route) {
    if (Get.currentRoute == route) return;
    Get.offAllNamed(route);
  }

  static void callBottomSheetDialog(BuildContext context, Widget page) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (_) => page,
    );
  }
}
