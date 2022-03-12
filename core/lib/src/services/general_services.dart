import 'dart:convert';
import 'dart:io';

import '../library/_library_exporter.dart';
import 'package:http/http.dart' as http;

class GeneralServices {
  Future<StringApiResponse?>? uploadImage(File file, String filename,
      {required Function(String) errorCallback}) async {
    try {
      String endpoint = ServerConfig.SERVER_URL + '/General/UploadImage';
      Map<String, String> headers = ServiceFactory.formHeaders();
      var mfile =
          http.MultipartFile.fromBytes('File', await file.readAsBytes(), filename: filename);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(endpoint),
      )
        ..headers.addAll(headers)
        ..files.add(mfile);
      var response = await request.send();
      var decodedResponse = json.decode(await response.stream.bytesToString());
      if (decodedResponse["HasError"]) {
        errorCallback.call(decodedResponse["Message"]);
        return null;
      }
      return StringApiResponse(response.statusCode, "Success", decodedResponse["Data"]);
    } catch (e) {
      errorCallback.call("En error occured during image upload");
      return null;
    }
  }
}
