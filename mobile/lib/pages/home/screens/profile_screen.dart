import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants/routes.dart';

import '../dialog/modal_content.dart';

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
        PlacePickerComponent(
          initialPosition: vc.accountController.accountX.value.location!,
          onPlacePicked: vc.setLocation,
          height: Suw.h(600),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: RectangleTextButton(
                text: "Save",
                backColor: Colors.white,
                textStyle: KTextStyle.h3(),
                icon: Icons.login,
                iconSize: 20,
                textColor: KColors.primaryColor,
                onPressed: vc.onSavePressed,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: RectangleTextButton(
                text: "Log Out",
                backColor: KColors.primaryColor,
                textStyle: KTextStyle.h3(
                  textStyleBase: const TextStyleBase(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Icons.login_sharp,
                iconSize: 20,
                textColor: Colors.white,
                onPressed: () {
                  vc.onLogout();
                  NavigationUtil.offAllNamed(AppRoutes.SIGN_SPLASH);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
