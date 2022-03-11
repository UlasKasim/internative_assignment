import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/_style_exporter.dart';

void successSnackbar({
  required String toastTitle,
  required String toastMessage,
  int duration = 2,
}) {
  Get.snackbar(
    toastTitle,
    toastMessage,
    duration: Duration(seconds: duration),
    colorText: Colors.white,
    backgroundColor: KColors.positiveColor.withOpacity(0.6),
    borderRadius: 0,
  );
}
