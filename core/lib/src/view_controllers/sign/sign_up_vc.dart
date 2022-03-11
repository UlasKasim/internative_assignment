import 'package:core/core.dart';
import 'package:get/get.dart';

import 'mixin/sign_mixin.dart';

class SignUpVC extends GetxController with SignMixin {
  void onSignUpPressed({required String route}) async {
    await userController.signUp(
      user: userX.value,
      passwordRetry: rePasswordX.value,
      onSuccess: (u) {
        NavigationUtil.offAllNamed(route);
        successSnackbar(
            toastTitle: "Başarıyla kayıt oldunuz", toastMessage: "Hoşgeldiniz ${u.email}");
      },
      onError: (e) {
        errorSnackbar(toastTitle: "Kayıt başarısız", toastMessage: e);
      },
    );
  }
}
