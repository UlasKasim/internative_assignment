import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

mixin AccountControllerMixin {
  Rx<Account> accountX = Account().obs;

  void updateAccount({required Account account}) {
    accountX.value = account;
  }

  void redraw() {
    accountX.refresh();
  }
}
