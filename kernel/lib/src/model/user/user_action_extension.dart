import '_user_exporter.dart';

extension UserActionExtension on User {
  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }
}
