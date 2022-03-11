import 'dart:convert';

import 'package:kernel/kernel.dart';
import '../library/_library_exporter.dart';
import 'package:http/http.dart' as http;

class AccountServices {
  Future<SingleApiResponse<Account>?>? getAccount({required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/Account/Get';
      Map<String, String> headers = ServiceFactory.jsonHeaders();
      var response = await http
          .get(Uri.parse(endpoint), headers: headers)
          .timeout(const Duration(seconds: 10));
      var decodedResponse = json.decode(response.body);
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      return SingleApiResponse<Account>(
          response.statusCode, "", Account.fromMap(decodedResponse["Data"]));
    } catch (e) {
      return null;
    }
  }

  Future<StringApiResponse?>? updateAccount(Account account,
      {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/Account/Update';
      Map<String, String> headers = ServiceFactory.jsonHeaders();
      var response = await http
          .post(Uri.parse(endpoint), headers: headers, body: json.encode(account.updateMap()))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return StringApiResponse(response.statusCode, "Success", "");
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
