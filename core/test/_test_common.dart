import 'package:core/src/library/config/server_config.dart';
import 'package:core/src/services/sign_services.dart';
import 'package:kernel/kernel.dart';

Future<void> getToken() async {
  var response = await SignServices()
      .signIn(User(email: "test1@test1.com", password: "123456"), errorCallback: (a) {});
  ServerConfig.TOKEN = response?.data ?? "";
}
