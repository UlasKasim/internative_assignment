import 'dart:io';

import 'package:core/src/services/_services_exporter.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GeneralController extends GetxController {
  Future<void> uploadImage({
    required File file,
    required String filename,
    required Function(String) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var response = await GeneralServices().uploadImage(file, filename, errorCallback: onError);
      if (response == null || response.data.isEmpty) {
        throw Exception();
      }
      onSuccess.call(response.data);
    } catch (e) {
      Logger().e("Error on UserController signIn. Error: $e");
    }
  }
}
