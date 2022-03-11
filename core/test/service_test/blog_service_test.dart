import 'package:core/src/services/_services_exporter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kernel/kernel.dart';

import '../_test_common.dart';

void main() async {
  group("BlogService", () {
    late Blog blog;
    setUpAll(() async {
      await getToken();
    });
    test("/Blog/GetBlogs", () async {
      try {
        var res = await BlogServices().getBlogs(null, errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
        if (!isResponseNull && res.data.isNotEmpty) {
          blog = res.data[0];
        }
      } catch (e) {
        fail('BlogService -> /Blog/GetBlogs failed');
      }
    });
    test("/Blog/ToggleFavorite", () async {
      try {
        var res = await BlogServices().toggleFavorite(blog.id!, errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('BlogService -> /Blog/ToggleFavorite failed');
      }
    });
  });
}
