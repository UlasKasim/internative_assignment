import 'package:core/src/style/_style_exporter.dart';
import 'package:core/src/widgets/_widgets_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialog extends StatelessWidget {
  final String acceptButtonText, message, title;
  final double? height, width;
  const ErrorDialog({
    Key? key,
    this.message = "Message",
    this.acceptButtonText = "TAMAM",
    this.title = "Hata",
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height ?? 320,
        width: width ?? 300,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomIcon(
              icon: Icons.close,
              iconSize: 60,
              borderRadiusBase: BorderRadiusBase.all(all: 50),
            ),
            const SizedBox(height: 20),
            CustomTitle(
              titleText: title,
              textAlign: TextAlign.center,
              style: KTextStyle.h2(
                textStyleBase: const TextStyleBase(
                  color: KColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTitle(
              titleText: message,
              textAlign: TextAlign.center,
              style: KTextStyle.h3(
                textStyleBase: const TextStyleBase(
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: RectangleTextButton(
                    onPressed: () {
                      Get.back();
                    },
                    backColor: KColors.primaryColor,
                    textColor: Colors.white,
                    text: acceptButtonText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//
