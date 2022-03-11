import 'package:core/src/services/_services_exporter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group("CategoryService", () {
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
