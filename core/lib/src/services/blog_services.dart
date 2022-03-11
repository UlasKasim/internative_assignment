import 'dart:convert';

import 'package:kernel/kernel.dart';
import '../library/_library_exporter.dart';
import 'package:http/http.dart' as http;

class BlogServices {
  Future<ListApiResponse<Blog>?>? getBlogs(String? categoryId,
      {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/Blog/GetBlogs';
      Map<String, String> headers = ServiceFactory.jsonHeaders();
      var response = await http
          .post(Uri.parse(endpoint),
              headers: headers, body: json.encode({"CategoryId": categoryId}))
          .timeout(const Duration(seconds: 10));
      var decodedResponse = json.decode(response.body);
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      List<Blog> list = [];
      List<dynamic> decodedList = decodedResponse["Data"] as List<dynamic>;
      for (var i = 0; i < decodedList.length; i++) {
        Blog item = Blog.fromMap(decodedList[i]);
        list.add(item);
      }
      return ListApiResponse<Blog>(
        response.statusCode,
        "Success",
        list,
        list.length,
      );
    } catch (e) {
      return null;
    }
  }

  Future<StringApiResponse?>? toggleFavorite(String favoriteID,
      {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/Blog/ToggleFavorite';
      Map<String, String> headers = ServiceFactory.jsonHeaders();
      var response = await http
          .post(Uri.parse(endpoint), headers: headers, body: json.encode({"Id": favoriteID}))
          .timeout(const Duration(seconds: 10));
      var decodedResponse = json.decode(response.body);
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      return StringApiResponse(response.statusCode, "Success", decodedResponse["Message"]);
    } catch (e) {
      return null;
    }
  }
}
