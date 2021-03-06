import 'package:core/src/services/_services_exporter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../_test_common.dart';

void main() async {
  group("CategoryService", () {
    setUpAll(() async {
      await getToken();
    });
    test("/Category/GetCategorys", () async {
      try {
        var res = await CategoryServices().getCategories(errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('CategoryService -> /Category/GetCategories failed');
      }
    });
  });
}
