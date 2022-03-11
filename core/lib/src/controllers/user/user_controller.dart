import 'package:core/src/library/config/server_config.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/_services_exporter.dart';
import '../_controller_exporter.dart';

class UserController extends GetxController {
  Rx<User> userX = User().obs;
  bool isLogged() => ServerConfig.TOKEN.isNotEmpty;
  SharedPreferences? sharedPreferences;

  @override
  void onInit() async {
    super.onInit();
    sharedPreferences = await SharedPreferences.getInstance();
    await getPreferences();
  }

  Future<void> signIn({
    required User user,
    required Function(User) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      ServerController serverController = Get.find();
      var response = await LoginServices().signIn(user, errorCallback: onError);
      if (response == null || response.data.isEmpty) {
        throw Exception();
      }
      ServerConfig.setToken(response.data);
      savePreferences(user);
      serverController.onStartServer();
      onSuccess.call(user);
    } catch (e) {
      Logger().e("Error on UserController signIn. Error: $e");
    }
  }

  Future<void> signUp({
    required User user,
    required String passwordRetry,
    required Function(User) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      ServerController serverController = Get.find();
      var response = await LoginServices().signUp(user, passwordRetry, errorCallback: onError);
      if (response == null || response.data.isEmpty) {
        throw Exception();
      }
      ServerConfig.setToken(response.data);
      savePreferences(user);
      serverController.onStartServer();
      onSuccess.call(user);
    } catch (e) {
      Logger().e("Error on UserController signUp. Error: $e");
    }
  }

  void savePreferences(User user) async {
    sharedPreferences?.setString("email", user.email!);
    sharedPreferences?.setString("password", user.password!);
  }

  Future<void> getPreferences() async {
    userX.value.onEmailChanged(sharedPreferences?.getString("email") ?? "");
    userX.value.onPasswordChanged(sharedPreferences?.getString("password") ?? "");
  }
}
