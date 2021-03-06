import 'package:core/src/style/_style_exporter.dart';
import 'package:core/src/widgets/_widgets_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog extends StatelessWidget {
  final String title;
  const LoadingDialog({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageBox(
              height: 30,
              padding: 0,
              isAssetImage: true,
              url: 'assets/images/loader.gif',
              boxFit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: KTextStyle.h4(),
            )
          ],
        ),
      ),
    );
  }
}

void callLoadingDialog({String title = ''}) {
  Get.dialog(
    LoadingDialog(
      title: title,
    ),
  );
}

void closeLoadingDialog() {
  var isDialogOpen = Get.isDialogOpen ?? true;
  if (isDialogOpen) {
    Get.back();
  }
}
