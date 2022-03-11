import 'package:core/src/controllers/_controller_exporter.dart';
import 'package:core/src/navigation/_navigation_exporter.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

mixin SignMixin {
  Rx<User> userX = User().obs;
  RxString rePasswordX = "".obs;

  UserController userController = Get.find();

  void onPushPressed({required String route}) {
    NavigationUtil.getPushNamed(route);
    // reset();
  }

  void onRePasswordChanged(String value) {
    rePasswordX.value = value;
  }

  void reset() {
    userX.value = User();
    rePasswordX.value = "";
  }
}
