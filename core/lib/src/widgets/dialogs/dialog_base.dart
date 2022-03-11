import 'package:get/get.dart';

import 'loading_dialog.dart';

class DialogBase {
  static void closeLoadingDialog() {
    bool isDialogOpen = Get.isDialogOpen ?? true;
    if (isDialogOpen) {
      Get.back();
    }
  }

  static void callLoadingDialog({String title = "Yükleniyor"}) {
    Get.dialog(
      LoadingDialog(
        title: title,
      ),
    );
  }
}
