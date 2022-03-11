import 'package:core/src/navigation/_navigation_exporter.dart';
import 'package:core/src/view_controllers/sign/mixin/sign_mixin.dart';
import 'package:core/src/widgets/_widgets_exporter.dart';
import 'package:get/get.dart';

class SignInVC extends GetxController with SignMixin {
  @override
  void onInit() async {
    super.onInit();
    userX.value = userController.userX.value;
    userX.refresh();
  }

  void onSignInPressed({required String route}) async {
    await userController.signIn(
      user: userX.value,
      onSuccess: (u) {
        NavigationUtil.offAllNamed(route);
        successSnackbar(
            toastTitle: "Başarıyla giriş yaptınız", toastMessage: "Hoşgeldiniz ${u.email}");
      },
      onError: (e) {
        errorSnackbar(toastTitle: "Giriş başarısız", toastMessage: e);
      },
    );
  }
}
