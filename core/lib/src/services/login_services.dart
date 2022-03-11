import 'dart:convert';

import 'package:kernel/kernel.dart';
import '../library/_library_exporter.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  Future<StringApiResponse?>? signIn(User user, {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/Login/SignIn';
      Map<String, String> headers = ServiceFactory.jsonHeaders();
      var response = await http
          .post(Uri.parse(endpoint), headers: headers, body: user.toJson())
          .timeout(const Duration(seconds: 10));
      var decodedResponse = json.decode(response.body);
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      return StringApiResponse(
          response.statusCode, decodedResponse["Message"] ?? "", decodedResponse["Data"]["Token"]);
    } catch (e) {
      return null;
    }
  }

  Future<StringApiResponse?>? signUp(User user, String passwordRetry,
      {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/Login/SignUp';
      Map<String, String> headers = ServiceFactory.jsonHeaders();
      var response = await http
          .post(Uri.parse(endpoint),
              headers: headers, body: json.encode(user.signUpMap(passwordRetry)))
          .timeout(const Duration(seconds: 10));
      var decodedResponse = json.decode(response.body);
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      return StringApiResponse(
          response.statusCode, decodedResponse["Message"] ?? "", decodedResponse["Data"]["Token"]);
    } catch (e) {
      return null;
    }
  }
}
