import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/component/_component_exporter.dart';
import 'package:mobile/constants/routes.dart';
import 'package:mobile/pages/profile/_profile_exporter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileVC vc = Get.put(ProfileVC());
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 150,
          width: 200,
          alignment: Alignment.center,
          child: Obx(
            () => ImageCircleAvatar(
              imageLink: vc.accountController.accountX.value.image,
              radius: 150.0,
              onCameraPressed: () {
                NavigationUtil.callBottomSheetDialog(context, ModalContent());
              },
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => PlacePickerComponent(
            initialPosition: vc.accountController.accountX.value.location!,
            onPlacePicked: vc.setLocation,
            height: Suw.h(600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GeneralButtonComponent(
          isPrimaryBackground: false,
          text: ProfileConstants.SAVE,
          rotate: true,
          onPressed: vc.onSavePressed,
        ),
        const SizedBox(height: 10),
        GeneralButtonComponent(
          isPrimaryBackground: true,
          text: ProfileConstants.LOG_OUT,
          rotate: true,
          onPressed: () {
            vc.onLogout();
            NavigationUtil.offAllNamed(AppRoutes.SIGN_SPLASH);
          },
        ),
      ],
    );
  }
}
