import 'package:kernel/src/validation/_validator_exporter.dart';
import '_user_exporter.dart';

extension UserValidationExtension on User {
  List<ValidatorBase> emailValidators() {
    String model = "Kullanıcı Adı";
    String value = email!;
    return [
      NotEmpty(
        message: _defaultNameString(model),
        value: value,
      ),
      NoWhitespace(
        message: _defaultNoWhiteSpaceString(model),
        value: value,
      ),
      IsEmail(
        message: _defaultEmailString(model),
      )
    ];
  }

  List<ValidatorBase> passwordValidators() {
    String model = "Şifre";
    String value = password!;
    return [
      NotEmpty(
        message: _defaultNameString(model),
        value: value,
      ),
      NoWhitespace(
        message: _defaultNoWhiteSpaceString(model),
        value: value,
      ),
    ];
  }

  String _defaultNameString(String model) {
    return "${model.firstLetterToUpperCase} boş bırakılamaz.";
  }

  String _defaultNoWhiteSpaceString(String model) {
    return "${model.firstLetterToUpperCase} boşlukla başlayamaz ve bitemez.";
  }

  String _defaultEmailString(String model) {
    return "${model.firstLetterToUpperCase} geçerli bir e-mail olmalıdır.";
  }
}
