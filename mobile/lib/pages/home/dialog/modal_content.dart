import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ModalContent extends StatelessWidget {
  // final Function
  ModalContent({Key? key}) : super(key: key);

  final ProfileVC vc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => Expanded(
            child: vc.selectedFileUrl.value == ""
                ? const Center(
                    child: Text("File not selected"),
                  )
                : ImageBox(url: vc.selectedFileUrl.value, isAssetImage: false),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 20,
              child: RectangleTextButton(
                text: "Select",
                backColor: KColors.primaryColor,
                textStyle: KTextStyle.h3(textStyleBase: const TextStyleBase(color: Colors.white)),
                icon: Icons.login_sharp,
                iconSize: 20,
                textColor: Colors.white,
                onPressed: () {
                  Get.dialog(selectPhotoDialogContent());
                },
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 20,
              child: RectangleTextButton(
                text: "Remove",
                backColor: Colors.white,
                textStyle: KTextStyle.h3(),
                icon: Icons.login_sharp,
                iconSize: 20,
                textColor: KColors.primaryColor,
                onPressed: vc.onFileRemovePressed,
              ),
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }

  Widget selectPhotoDialogContent() {
    return Dialog(
      child: Container(
        height: 200,
        width: Suw.w(800),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            KDecoration.boxDecoration(borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Column(
          children: [
            const Expanded(child: Center(child: Text("Select a Picture"))),
            Row(
              children: [
                Expanded(
                  child: RectangleTextButton(
                    text: "Camera",
                    backColor: KColors.primaryColor,
                    textStyle:
                        KTextStyle.h3(textStyleBase: const TextStyleBase(color: Colors.white)),
                    icon: Icons.camera_alt_rounded,
                    iconSize: 20,
                    textColor: Colors.white,
                    onPressed: () => vc.onFileSelectPressed(ImageSource.camera),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: RectangleTextButton(
                    text: "Gallery",
                    backColor: Colors.white,
                    textStyle: KTextStyle.h3(),
                    icon: Icons.image,
                    iconSize: 20,
                    textColor: KColors.primaryColor,
                    onPressed: () => vc.onFileSelectPressed(ImageSource.gallery),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
