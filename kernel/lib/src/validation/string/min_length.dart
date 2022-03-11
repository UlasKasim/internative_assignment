import '../_validator_exporter.dart';

class Minlength implements ValidatorBase<String> {
  @override
  String? value;
  int length;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  Minlength({
    this.value,
    this.length = ValidationConstants.defaultMinLength,
    this.message,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultMinLengthMessage(length);
  }

  @override
  bool isValid(String value) {
    return value.length >= length;
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;

    return message ?? ValidationConstants.defaultMinLengthMessage(length);
  }
}
