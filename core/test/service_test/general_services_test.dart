import 'dart:io';

import 'package:core/src/services/_services_exporter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

import '../_test_common.dart';

void main() async {
  group("GeneralService", () {
    setUpAll(() async {
      await getToken();
    });
    test("/General/UploadImage", () async {
      try {
        var res = await GeneralServices()
            .uploadImage(File(path.absolute("assets", "images", "logo.png")), "logo.png",
                errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('GeneralService -> /General/UploadImage failed');
      }
    });
  });
}
