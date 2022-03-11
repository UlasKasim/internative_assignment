import 'package:core/src/services/account_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kernel/kernel.dart';

void main() async {
  group("AccountService", () {
    late Account account;
    test("/Account/Get", () async {
      try {
        var res = await AccountServices().getAccount(errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
        if (!isResponseNull) {
          account = res.data;
        }
      } catch (e) {
        fail('AccountService -> /Account/Get failed');
      }
    });
    test("/Account/Update", () async {
      try {
        var res = await AccountServices().updateAccount(account, errorCallback: (error) {
          fail(error);
        });
        var isResponseNull = res == null;
        expect(isResponseNull, false);
      } catch (e) {
        fail('AccountService -> /Account/Update failed');
      }
    });
  });
}
