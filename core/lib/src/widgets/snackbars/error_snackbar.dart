import 'package:core/src/style/_style_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorSnackbar({
  required String toastTitle,
  required String toastMessage,
}) {
  Get.snackbar(
    toastTitle,
    toastMessage,
    duration: const Duration(seconds: 2),
    colorText: Colors.white,
    backgroundColor: KColors.negativeColor.withOpacity(0.6),
    borderRadius: 0,
  );
}
