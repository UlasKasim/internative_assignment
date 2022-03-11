import 'package:core/src/services/_services_exporter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kernel/kernel.dart';

void main() async {
  group("SignService", () {
    User user = User(
        email: "${CommonMethods.getRandomString(6)}@${CommonMethods.getRandomString(6)}.com",
        password: CommonMethods.getRandomString(6));
    test("/Sign/SignUp", () async {
      try {
        var res = await SignServices().signUp(user, user.password!, errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('SignService -> /Sign/SignUp failed');
      }
    });
    test("/Sign/SignIn", () async {
      try {
        var res = await SignServices().signIn(user, errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('SignService -> /Sign/SignIn failed');
      }
    });
  });
}
