import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/component/_component_exporter.dart';
import 'package:mobile/pages/profile/_profile_exporter.dart';

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
                ? Center(
                    child: Text(ProfileConstants.FILE_NOT_SELECTED),
                  )
                : ImageBox(url: vc.selectedFileUrl.value, isAssetImage: false),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            GeneralButtonComponent(
              isPrimaryBackground: true,
              text: ProfileConstants.SELECT,
              rotate: true,
              onlyExpand: true,
              onPressed: () {
                Get.dialog(selectPhotoDialogContent(context));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            GeneralButtonComponent(
              isPrimaryBackground: false,
              text: ProfileConstants.REMOVE,
              rotate: true,
              onlyExpand: true,
              onPressed: vc.onFileRemovePressed,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    );
  }

  Widget selectPhotoDialogContent(context) {
    return Dialog(
      child: Container(
        height: 200,
        width: Suw.w(context, 800),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            KDecoration.boxDecoration(borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Column(
          children: [
            Expanded(child: Center(child: Text(ProfileConstants.SELECT_A_PICTURE))),
            GeneralButtonComponent(
              isPrimaryBackground: true,
              text: ProfileConstants.CAMERA,
              icon: Icons.camera_alt_rounded,
              onPressed: () => vc.onFileSelectPressed(ImageSource.camera),
            ),
            const SizedBox(
              height: 10,
            ),
            GeneralButtonComponent(
              isPrimaryBackground: false,
              text: ProfileConstants.GALLERY,
              icon: Icons.image,
              onPressed: () => vc.onFileSelectPressed(ImageSource.gallery),
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
