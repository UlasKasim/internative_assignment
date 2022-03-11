import 'package:core/src/services/_services_exporter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kernel/kernel.dart';

void main() async {
  group("LoginService", () {
    User user = User(
        email: "${CommonMethods.getRandomString(6)}@${CommonMethods.getRandomString(6)}.com",
        password: CommonMethods.getRandomString(6));
    test("/Login/SignUp", () async {
      try {
        var res = await LoginServices().signUp(user, user.password!, errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('LoginService -> /Login/SignUp failed');
      }
    });
    test("/Login/SignIn", () async {
      try {
        var res = await LoginServices().signIn(user, errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('LoginService -> /Login/SignIn failed');
      }
    });
  });
}
