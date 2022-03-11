import 'dart:convert';
import 'dart:io';

import '../library/_library_exporter.dart';
import 'package:http/http.dart' as http;

class GeneralServices {
  Future<StringApiResponse?>? uploadImage(File file,
      {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/General/UploadImage';
      Map<String, String> headers = ServiceFactory.formHeaders();
      var mfile = http.MultipartFile.fromBytes('profile', await file.readAsBytes());
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(endpoint),
      )
        ..headers.addAll(headers)
        ..files.add(mfile);
      var response = await request.send().timeout(const Duration(seconds: 10));
      var decodedResponse = json.decode(await response.stream.bytesToString());
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      return StringApiResponse(response.statusCode, "Success", decodedResponse["Data"]);
    } catch (e) {
      return null;
    }
  }
}
