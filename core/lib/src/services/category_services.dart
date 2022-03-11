import 'dart:convert';

import 'package:kernel/kernel.dart';
import '../library/_library_exporter.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  Future<ListApiResponse<Category>?>? getCategories(
      {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/Blog/GetCategories';
      Map<String, String> headers = ServiceFactory.jsonHeaders();
      var response = await http
          .get(Uri.parse(endpoint), headers: headers)
          .timeout(const Duration(seconds: 10));
      var decodedResponse = json.decode(response.body);
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      List<Category> list = [];
      List<dynamic> decodedList = decodedResponse["Data"] as List<dynamic>;
      for (var i = 0; i < decodedList.length; i++) {
        Category item = Category.fromMap(decodedList[i]);
        list.add(item);
      }
      return ListApiResponse<Category>(
        response.statusCode,
        "Success",
        list,
        list.length,
      );
    } catch (e) {
      return null;
    }
  }
}
