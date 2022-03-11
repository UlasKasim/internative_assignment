import 'package:kernel/src/constants/_constants_exporter.dart';
import 'package:kernel/src/validation/_validator_exporter.dart';

class IsEmail implements ValidatorBase<String> {
  @override
  String? value;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  IsEmail({
    this.value,
    this.message = ValidationConstants.defaultIsEmailMessage,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;
    return message;
  }

  @override
  bool isValid(String value) {
    return RegExpConstants.emailRegExp.hasMatch(value) || value == "";
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;
    return message;
  }
}
